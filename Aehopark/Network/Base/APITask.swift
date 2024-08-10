//
//  APITask.swift
//  Aehopark
//
//  Created by wodnd on 8/10/24.
//
import Foundation
import Alamofire

enum APITask {
    case requestPlain
    case requestParameters(parameters: Parameters)
    case requestJSONEncodable(body: Encodable)
    case requestWithoutInterceptor(body: Encodable? = nil)
    /// 이미지와 함께 body 전송
    /// Interceptor 사용하려면 true로, 미사용이라면 false
    case requestJSONWithImage(multipartFile: [Foundation.Data?], body: Encodable, withInterceptor: Bool = true)
    case requestJSONWithImageWithParam(multipartFile: [Foundation.Data?], body: Encodable, withInterceptor: Bool = true, parameters: Parameters)
}
