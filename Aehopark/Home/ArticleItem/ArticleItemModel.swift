//
//  ArticleItemModel.swift
//  Aehopark
//
//  Created by wodnd on 7/16/24.
//

import Foundation

struct ArticleItemModel: Codable {
    let id: Int64
    let imageUrl: String
    let originType: String
    let categoryType: String
    let name: String
    let price: String
    var isFavorite: Bool
}
