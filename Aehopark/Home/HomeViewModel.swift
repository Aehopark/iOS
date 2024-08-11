//
//  HomeViewModel.swift
//  Aehopark
//
//  Created by wodnd on 7/14/24.
//

import Foundation
class HomeViewModel: ObservableObject {
    struct State {
        var getRecommendItemResponse = HomeModel(ad: [adModel(id: "", url: "", image_url: "")], list: [ArticleItemModel(id: 2, category: "", ingredient: "호박", imageUrl: "https://github.com/user-attachments/assets/23706cb9-b773-4d03-80c4-134870219f73", wishlistStatus: 1), ArticleItemModel(id: 4, category: "", ingredient: "호박", imageUrl: "https://github.com/user-attachments/assets/23706cb9-b773-4d03-80c4-134870219f73", wishlistStatus: 1), ArticleItemModel(id: 0, category: "", ingredient: "호박", imageUrl: "https://github.com/user-attachments/assets/23706cb9-b773-4d03-80c4-134870219f73", wishlistStatus: 1), ArticleItemModel(id: 1, category: "", ingredient: "호박", imageUrl: "https://github.com/user-attachments/assets/23706cb9-b773-4d03-80c4-134870219f73", wishlistStatus: 1)])
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
