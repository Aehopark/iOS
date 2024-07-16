//
//  NetworkManager.swift
//  Aehopark
//
//  Created by wodnd on 7/16/24.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func request<T: Decodable>(_ endPoint: EndPoint) async -> BaseResponse<T>? {
        let request = makeDataRequest(endPoint)
        let result = await request.serializingData().result
        var data = Foundation.Data()
        do {
            print("request: " + "\(endPoint.headers)")
            data = try result.get()
        } catch {
            print("data fetch error")
            return nil
        }
        
        do {
            let decodedData = try data.decode(type: BaseResponse<T>.self, decoder: JSONDecoder())
            return decodedData
        } catch {
            print("data decode error - origin data: \(String(data: data, encoding: .utf8) ?? "")")
            return nil
        }
        
    }
    
    
    private func makeDataRequest(_ endPoint: EndPoint) -> DataRequest {
        switch endPoint.task {
        case .requestPlain:
            return AF.request(
                "\(endPoint.baseURL)\(endPoint.path)",
                method: endPoint.method,
                headers: endPoint.headers,
                interceptor: Interceptor()
            )
        case .requestParameters(let parameters):
            return AF.request(
                "\(endPoint.baseURL)\(endPoint.path)",
                method: endPoint.method,
                parameters: parameters,
                encoding: URLEncoding.default,
                headers: endPoint.headers,
                interceptor: Interceptor()
            )
        case .requestJSONEncodable(let body):
            return AF.request(
                "\(endPoint.baseURL)\(endPoint.path)",
                method: endPoint.method,
                parameters: body,
                encoder: JSONParameterEncoder.default,
                headers: endPoint.headers,
                interceptor: Interceptor()
            )
        case .requestWithoutInterceptor(let body):
            if body == nil {
                return AF.request(
                    "\(endPoint.baseURL)\(endPoint.path)",
                    method: endPoint.method,
                    headers: endPoint.headers
                )
            } else {
                return AF.request(
                  "\(endPoint.baseURL)\(endPoint.path)",
                  method: endPoint.method,
                  parameters: body!,
                  encoder: JSONParameterEncoder.default,
                  headers: endPoint.headers
                )
            }
        case .requestJSONWithImage(let multipartFile, let body, let withInterceptor):
            return AF.upload(multipartFormData: { multipartFormData in
                for image in multipartFile {
                    if let image = image {
                        multipartFormData.append(image, withName: "multipartFile", fileName: "\(image).jpeg", mimeType: "image/jpeg")
                    }
                }
                if let jsonData = try? JSONEncoder().encode(body) {
                    multipartFormData.append(jsonData, withName: "reqDto", mimeType: "application/json")
                }
            }, to: URL(string: "\(endPoint.baseURL)\(endPoint.path)")!, method: endPoint.method, headers: endPoint.headers, interceptor: withInterceptor ? Interceptor() : nil)
        }
    }
}

extension Foundation.Data {
    func decode<Item: Decodable, Decoder: DataDecoder>(type: Item.Type, decoder: Decoder = JSONDecoder()) throws -> Item {
        try decoder.decode(type, from: self)
    }
}
