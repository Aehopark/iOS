//
//  SearchModel.swift
//  Aehopark
//
//  Created by wodnd on 7/22/24.
//

import Foundation
struct SearchModel: Codable {
    let totalElemnets: Int
    var data: [ArticleItemModel]
    
    init(totalElemnets: Int = 0, data: [ArticleItemModel] = []) {
        self.totalElemnets = totalElemnets
        self.data = data
    }
}


struct SearchResponse: Codable {
    var totalElements: Int
    var data: [ArticleItemModel]
    
    init(totalElements: Int = 0, data: [ArticleItemModel] = []) {
        self.totalElements = totalElements
        self.data = data
    }
}

struct SearchAllCategoryResponse: Codable {
    var all: SearchModel
    var vegetables: SearchModel
    var eggs: SearchModel
    var fruit: SearchModel
    var fisheries: SearchModel
    var cereals: SearchModel
    var dairyProducts: SearchModel
    
    init(
        all: SearchModel = SearchModel(),
        vegetables: SearchModel = SearchModel(),
        eggs: SearchModel = SearchModel(),
        fruit: SearchModel = SearchModel(),
        fisheries: SearchModel = SearchModel(),
        cereals: SearchModel = SearchModel(),
        dairyProducts: SearchModel = SearchModel())
    {
        self.all = all
        self.vegetables = vegetables
        self.eggs = eggs
        self.fruit = fruit
        self.fisheries = fisheries
        self.cereals = cereals
        self.dairyProducts = dairyProducts
    }
}
