//
//  ArticleItemModel.swift
//  Aehopark
//
//  Created by wodnd on 7/16/24.
//

import Foundation

struct ArticleItemModel: Codable {
    let id: Int64
    let originType: String
    let category: String
    let ingredient: String
    let image_url: String
    var wishlist_status: Bool
}
