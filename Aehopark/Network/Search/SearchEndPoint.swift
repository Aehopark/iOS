//
//  ViewModel.swift
//  Aehopark
//
//  Created by wodnd on 7/29/24.
//

import Foundation
import Alamofire

enum SearchEndPoint {
    case getAllItem(page: Int64) //모든 아이템
    case getSearchItem(ingredient_name: String, page: Int64) // 검색 아이템
    case getCategoryItem(category_name: String, page: Int64) // 카테고리 아이템
    case getCategorySearchItem(category_name: String, ingredient_name: String, page: Int64) //카테고리 선택후 검색 아이템
}

extension SearchEndPoint: EndPoint {
    var baseURL: String {
        return "http://13.124.154.79:8080"
    }
    
    var path: String {
        switch self {
        case .getAllItem(let page):
            return "/product?page=\(page)"
        case .getSearchItem(let ingredient_name, let page):
            return "/product/search?ingredient=\(ingredient_name)&page=\(page)"
        case .getCategoryItem(let category_name, let page):
            return "/product/\(category_name)?page=\(page)"
        case .getCategorySearchItem(let category_name, let ingredient_name, let page):
            return "/product/\(category_name)/search?ingredient=\(ingredient_name)&?page=\(page)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getAllItem:
            return .get
        case .getSearchItem:
            return .get
        case .getCategoryItem:
            return .get
        case .getCategorySearchItem:
            return .get
        }
    }
    
    var task: APITask {
        switch self {
        case let .getAllItem(page):
            return .requestPlain
        case let .getSearchItem(ingredient_name, page):
            return .requestPlain
        case let .getCategoryItem(category_name, page):
            return .requestPlain
        case let .getCategorySearchItem(category_name, ingredient_name, page):
            return .requestPlain
        }
    }
}

