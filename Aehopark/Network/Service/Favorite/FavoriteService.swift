//
//  FavoriteService.swift
//  Aehopark
//
//  Created by wodnd on 7/16/24.
//

import Foundation
import Alamofire
import SwiftUI

struct FavoriteService {
    static func toggleFavorite(id: Int) async -> BaseResponse<ToggleFavoriteResponse>? {
        return await NetworkManager.shared.request(FavoriteEndPoint.toggleFavorite(body: FavoriteToggleRequest(id: id)))
    }
}

struct ToggleFavoriteResponse: Codable {
    var isFavorite: Bool
}

struct FavoriteToggleRequest: Codable {
    let id: Int
    
    init(id: Int) {
        self.id = id
    }
}
