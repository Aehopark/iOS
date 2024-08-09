//
//  HomeViewModel.swift
//  Aehopark
//
//  Created by wodnd on 7/14/24.
//

import Foundation
class HomeViewModel: ObservableObject {
    struct State {
            var getRecommendItemResponse = HomeModel(ad: [adModel(id: "", url: "", image_url: "")], list: [ArticleItemModel(id: 0, originType: "", category: "", ingredient: "호박", image_url: "https://github.com/user-attachments/assets/23706cb9-b773-4d03-80c4-134870219f73", wishlist_status: true), ArticleItemModel(id: 1, originType: "", category: "", ingredient: "호박", image_url: "https://github.com/user-attachments/assets/23706cb9-b773-4d03-80c4-134870219f73", wishlist_status: true), ArticleItemModel(id: 2, originType: "", category: "", ingredient: "호박", image_url: "https://github.com/user-attachments/assets/23706cb9-b773-4d03-80c4-134870219f73", wishlist_status: true), ArticleItemModel(id: 3, originType: "", category: "", ingredient: "호박", image_url: "https://github.com/user-attachments/assets/23706cb9-b773-4d03-80c4-134870219f73", wishlist_status: true)])
        }

    enum Action {
        case getRecommendItem
    }
        
    @Published var state: State
    
    init(
        state: State = .init()
    ) {
        self.state = state
    }
    
    func action(_ action: Action) async {
            switch action {
            case .getRecommendItem:
                // TODO - 제주맛집 API 호출
                if let response = await HomeService.getHomeRecommendItem(),
                   let responseData = response.result {
                    await MainActor.run {
                        print(response)
                        state.getRecommendItemResponse = responseData
                    }
                } else {
                    print("Error")
                }
            }
        }

}
