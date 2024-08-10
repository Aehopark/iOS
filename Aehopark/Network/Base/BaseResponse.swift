//
//  BaseResponse.swift
//  Aehopark
//
//  Created by wodnd on 8/10/24.
//

import Foundation

struct EmptyResponseModel: Codable {
    
}

struct BaseResponse<T: Codable>: Codable {
    let message: String
    let result: T?

    enum CodingKeys: String, CodingKey {
        case message
        case result
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        message = try container.decode(String.self, forKey: .message)
        result = try container.decodeIfPresent(T.self, forKey: .result)
    }
}

struct DeleteResponse: Codable {
    let message: String

    enum CodingKeys: String, CodingKey {
        case message
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        message = try container.decode(String.self, forKey: .message)
    }
}
