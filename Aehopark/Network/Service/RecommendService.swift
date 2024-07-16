//
//  Network.swift
//  Aehopark
//
//  Created by wodnd on 7/16/24.
//

import Foundation

struct RecommendService {
    static func getRecommendItem() async -> BaseResponse<HomeModel>? {
        return await NetworkManager.shared.request(RecommendEndPoint.getRecommendItem)
    }
}
