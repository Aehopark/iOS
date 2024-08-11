//
//  ArticleItemModel.swift
//  Aehopark
//
//  Created by wodnd on 7/16/24.
//

import Foundation

struct ArticleItemModel: Codable {
    let id: Int64
    let category: String
    let ingredient: String
    let imageUrl: String?
    var wishlistStatus: Int64
}
