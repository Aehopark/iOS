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
        var allResponse = SearchAllCategoryResponse()
        var vegetablesResponse = SearchResponse()
        var eggsResponse = SearchAllCategoryResponse()
        var fruitResponse = SearchAllCategoryResponse()
        var fisheriesResponse = SearchAllCategoryResponse()
        var cerealsResponse = SearchAllCategoryResponse()
        var dairyProductsResponse = SearchAllCategoryResponse()
        
        var searchVolumeResult: [ArticleItemModel] = []
    }
    
    
    @Published var state: State
    
    init(
        state: State = .init()
    ) {
        self.state = state
    }
}
