//
//  SearchViewModel.swift
//  Aehopark
//
//  Created by wodnd on 7/22/24.
//

import Foundation
@MainActor
final class SearchViewModel: ObservableObject {
    struct State{
        // 모든 재료 표시
        var getAllItemResponse: [ArticleItemModel] = [ArticleItemModel(id: 0, category: "", ingredient: "", imageUrl: "", wishlistStatus: 1)]
        //통합 검색
        var getSearchItemResponse =  SearchModel(result: [ArticleItemModel(id: 1, category: "", ingredient: "", imageUrl: "", wishlistStatus: 1)])
        
        //카테고리 선택
        var getCategoryItemResponse =  SearchModel(result: [ArticleItemModel(id: 2, category: "", ingredient: "", imageUrl: "", wishlistStatus: 1)])
        //카테고리 선택 후 검색
        var getCategorySearchItemResponse =  SearchModel(result: [ArticleItemModel(id: 3, category: "", ingredient: "", imageUrl: "", wishlistStatus: 1)])
    }
    
    enum Action {
        case getAllItem(page: Int64)
        case getSearchItem(ingredient_name: String, page: Int64)
        case getCategoryItem(category_name: String, page: Int64)
        case getCategorySearchItem(category_name: String, ingredient_name: String, page: Int64)
    }
       
    
    
    @Published var state: State
    
    init(
        state: State = .init()
    ) {
        self.state = state
    }
    
    func action(_ action: Action) async {
            switch action {
            case let .getAllItem(page):
                if let response = await SearchService.getAllItem(page: page),
                   let responseData = response.result {
                    await MainActor.run {
                        print(response)
                        state.getAllItemResponse = responseData
                    }
                } else {
                    print("Error")
                }
            case let .getSearchItem(ingredient_name, page):
                // TODO - 통합 검색API 호출
                if let response = await SearchService.getSearchItem(ingredient_name: ingredient_name, page: page),
                   let responseData = response.result {
                    await MainActor.run {
                        print(response)
                        state.getSearchItemResponse = responseData
                    }
                } else {
                    print("Error")
                }
            case let .getCategoryItem(category_name, page):
                // TODO - 카테고리 선택 API 호출
                if let response = await SearchService.getCategoryItem(category_name: category_name, page: page),
                   let responseData = response.result {
                    await MainActor.run {
                        print(response)
                        state.getCategoryItemResponse = responseData
                    }
                } else {
                    print("Error")
                }
            case let .getCategorySearchItem(category_name, ingredient_name, page):
                // TODO - 카테고리 선택후 검색 API 호출
                if let response = await SearchService.getCategorySearchItem(category_name: category_name, ingredient_name: ingredient_name, page: page),
                   let responseData = response.result {
                    await MainActor.run {
                        print(response)
                        state.getCategorySearchItemResponse = responseData
                    }
                } else {
                    print("Error")
                }
            }
        }

}
