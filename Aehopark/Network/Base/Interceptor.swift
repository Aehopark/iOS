//
//  Interceptor.swift
//  Aehopark
//
//  Created by wodnd on 8/10/24.
//

import Foundation
import Alamofire

class Interceptor: RequestInterceptor {
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        guard let accessToken = KeyChainManager.readItem(key: "accessToken") else {
            // 토큰이 없는경우 로그인 화면으로 이동
            DispatchQueue.main.async {
                UserDefaults.standard.set(false, forKey: "isLogin")
            }
            
            completion(.failure(AuthError.noToken))
            return
        }
        
        var urlRequest = urlRequest
        urlRequest.headers.add(.authorization("Bearer \(accessToken)"))
        print("JWT: \(accessToken)")
        
        completion(.success(urlRequest))
    }
}

//TODO: 임시용 에러. 후에 에러 처리 로직 필요
enum AuthError: Error {
    case noToken
}
