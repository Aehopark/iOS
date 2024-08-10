//
//  NickNameEndPoint.swift
//  Aehopark
//
//  Created by wodnd on 8/11/24.
//

import Foundation
import Alamofire

enum NicknameEndPoint {
    case checkNicknameItem(nickname: String) // 닉네임 중복확인
}

extension NicknameEndPoint: EndPoint {
    var baseURL: String {
        return "http://13.124.154.79:8080"
    }
    
    var path: String {
        switch self {
        case .checkNicknameItem(let nickname):
            return "/user/checkNick?nickname=\(nickname)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .checkNicknameItem:
            return .get
        }
    }
    
    var task: APITask {
        switch self {
        case let .checkNicknameItem(nickname):
            return .requestPlain
        }
    }
}

