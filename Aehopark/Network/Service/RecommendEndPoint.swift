//
//  RecommedEndPoint.swift
//  Aehopark
//
//  Created by wodnd on 7/16/24.
//

import Foundation
import Alamofire

enum RecommendEndPoint {
    case getRecommendItem
}

extension RecommendEndPoint: EndPoint {
    var baseURL: String {
        return ""
    }
    
    var path: String {
        return ""
    }
    
    var method: Alamofire.HTTPMethod {
        return .get
    }
    
    var task: APITask {
        switch self {
        case .getRecommendItem:
            return .requestPlain
        }
    }
    
    
}
