//
//  HomeEndPoint.swift
//  Aehopark
//
//  Created by wodnd on 8/10/24.
//

import Foundation
import Alamofire

enum HomeEndPoint {
    case getHomeRecommnedItem // 메인 광고 및 추천 아이템
}

extension HomeEndPoint: EndPoint {
    var baseURL: String {
        return "http://13.124.154.79:8080"
    }
    
    var path: String {
        switch self {
        case .getHomeRecommnedItem:
            return "/product/good-ingredient"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getHomeRecommnedItem:
            return .get
        }
    }
    
    var task: APITask {
        switch self {
        case let .getHomeRecommnedItem:
            return .requestPlain
        }
    }
}
