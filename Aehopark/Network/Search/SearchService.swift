//
//  HomeService.swift
//  Aehopark
//
//  Created by wodnd on 7/29/24.
//

import Foundation
import Alamofire
import UIKit

struct SearchService {
    static func getAllItem(page: Int64) async -> BaseResponse<[ArticleItemModel]>? {
        return await NetworkManager.shared.request(SearchEndPoint.getAllItem(page: page))
    }
    
    static func getSearchItem(ingredient_name: String, page: Int64) async -> BaseResponse<SearchModel>? {
        return await NetworkManager.shared.request(SearchEndPoint.getSearchItem(ingredient_name: ingredient_name, page: page))
    }
    
    static func getCategoryItem(category_name: String, page: Int64) async -> BaseResponse<SearchModel>? {
        return await NetworkManager.shared.request(SearchEndPoint.getCategoryItem(category_name: category_name, page: page))
    }
    
    static func getCategorySearchItem(category_name: String, ingredient_name: String, page: Int64) async -> BaseResponse<SearchModel>? {
        return await NetworkManager.shared.request(SearchEndPoint.getCategorySearchItem(category_name: category_name, ingredient_name: ingredient_name, page: page))
    }
    
}
