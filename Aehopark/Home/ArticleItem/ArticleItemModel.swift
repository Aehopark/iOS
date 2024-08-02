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
    var isFavorite: Bool
    
    init(id: Int64, imageUrl: String, originType: String, categoryType: String, name: String, price: String, isFavorite: Bool) {
        self.id = id
        self.imageUrl = imageUrl
        self.originType = originType
        self.categoryType = categoryType
        self.name = name
        self.isFavorite = isFavorite
    }
    
    init(from searchArticle: ArticleItemModel, category: String) {
        self.id = searchArticle.id
        self.imageUrl = searchArticle.imageUrl
        self.originType = searchArticle.originType
        self.categoryType = category
        self.name = searchArticle.name
        self.isFavorite = searchArticle.isFavorite
    }
}
