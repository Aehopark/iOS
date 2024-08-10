//
//  HomeService.swift
//  Aehopark
//
//  Created by wodnd on 8/10/24.
//

import Foundation
struct HomeService {
    static func getHomeRecommendItem() async -> BaseResponse<HomeModel>? {
        return await NetworkManager.shared.request(HomeEndPoint.getHomeRecommnedItem)
    }
}

//
//func searchGoodProduct(completion: @escaping (Result<GoodProductResponse, Error>) -> Void) {
//    let URL = "/product/good-ingredient?page=1"
//    
//    let token = UserDefaults.standard.string(forKey: "AccessToken") ?? ""
//    let headers: HTTPHeaders = [.authorization(bearerToken: token)]
//    
//    AF.request(URL,
//               method: .get,
//               headers: headers)
//    .validate(statusCode: 200..<300)
//    .responseDecodable(of: GoodProductResponse.self) { response in
//        switch response.result {
//        case .success(let result):
//            completion(.success(result))
//        case .failure(let error):
//            completion(.failure(error))
//        }
//    }
//}


//struct Ad: Codable {
//    var id: String
//    var url: String
//    var imageUrl: String
//
//    private enum CodingKeys: String, CodingKey {
//        case id = "id"
//        case url = "url"
//        case imageUrl = "image_url"
//    }
//}
//
//struct Ingredient: Codable {
//    var id: String
//    var category: String
//    var ingredient: String
//    var imageUrl: String
//    var wishlistStatus: Int
//
//    private enum CodingKeys: String, CodingKey {
//        case id = "id"
//        case category = "category"
//        case ingredient = "ingredient"
//        case imageUrl = "image_url"
//        case wishlistStatus = "wishlist_status"
//    }
//}
//
//struct result: Codable {
//    var ad: [Ad?]
//    var list: [Ingredient?]
//
//    private enum CodingKeys: String, CodingKey {
//        case ad = "ad"
//        case list = "list"
//    }
//}
//
//struct GoodProductResponse: Codable {
//    var message: String?
//    var result: result?
//
//    private enum CodingKeys: String, CodingKey {
//        case message = "message"
//        case result = "result"
//    }
//}
