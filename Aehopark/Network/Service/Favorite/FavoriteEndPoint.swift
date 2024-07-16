//
//  FavoriteEndPoint.swift
//  Aehopark
//
//  Created by wodnd on 7/16/24.
//

import Foundation
import Alamofire

enum FavoriteEndPoint {
    case toggleFavorite(body: FavoriteToggleRequest)
}

extension FavoriteEndPoint: EndPoint {
    var baseURL: String{
        return "\(Secret.baseUrl)/favorite"
    }
    
    var path: String {
        switch self {
        case .toggleFavorite:
            return "/like"
        }
    }
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .toggleFavorite:
            return .post
        }
    }
    
    var task: APITask {
        switch self {
        case let .toggleFavorite(body: body):
            return .requestJSONEncodable(body: body)
        }
    }
    
    
}
