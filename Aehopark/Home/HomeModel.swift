//
//  HomeModel.swift
//  Aehopark
//
//  Created by wodnd on 7/14/24.
//

import Foundation
struct HomeModel: Codable{
    var ad: [adModel]
    var list: [ArticleItemModel]
}


struct adModel: Codable {
    let id: String
    let url: String
    let image_url: String
}


