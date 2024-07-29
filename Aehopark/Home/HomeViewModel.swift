//
//  HomeViewModel.swift
//  Aehopark
//
//  Created by wodnd on 7/14/24.
//

import Foundation
class HomeViewModel: ObservableObject {
    struct State {
            var getRecommendItemResponse: HomeModel
            
            init(getRecommendItemResponse: HomeModel = HomeModel(recommendItems: [
                ArticleItemModel(id: 1, imageUrl: "https://via.placeholder.com/150", originType: "Organic", categoryType: "Fruit", name: "Apple", price: "$1.00", isFavorite: false),
                ArticleItemModel(id: 2, imageUrl: "https://via.placeholder.com/150", originType: "Organic", categoryType: "Vegetable", name: "Carrot", price: "$0.50", isFavorite: true),
                ArticleItemModel(id: 3, imageUrl: "https://via.placeholder.com/150", originType: "Natural", categoryType: "Meat", name: "Chicken", price: "$5.00", isFavorite: false),
                ArticleItemModel(id: 4, imageUrl: "https://via.placeholder.com/150", originType: "Natural", categoryType: "Fish", name: "Salmon", price: "$10.00", isFavorite: true),
                ArticleItemModel(id: 5, imageUrl: "https://via.placeholder.com/150", originType: "Organic", categoryType: "Dairy", name: "Milk", price: "$2.00", isFavorite: false),
                ArticleItemModel(id: 6, imageUrl: "https://via.placeholder.com/150", originType: "Organic", categoryType: "Fruit", name: "Banana", price: "$1.20", isFavorite: true),
                ArticleItemModel(id: 7, imageUrl: "https://via.placeholder.com/150", originType: "Natural", categoryType: "Vegetable", name: "Broccoli", price: "$1.50", isFavorite: false),
                ArticleItemModel(id: 8, imageUrl: "https://via.placeholder.com/150", originType: "Natural", categoryType: "Meat", name: "Beef", price: "$15.00", isFavorite: true),
                ArticleItemModel(id: 9, imageUrl: "https://via.placeholder.com/150", originType: "Organic", categoryType: "Dairy", name: "Cheese", price: "$3.00", isFavorite: false),
                ArticleItemModel(id: 10, imageUrl: "https://via.placeholder.com/150", originType: "Organic", categoryType: "Fruit", name: "Orange", price: "$1.00", isFavorite: true)
            ])) {
                self.getRecommendItemResponse = getRecommendItemResponse
            }
        }

    @Published var state: State
    
    init(
        state: State = .init()
    ) {
        self.state = state
    }
}

