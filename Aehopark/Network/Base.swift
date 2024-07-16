//
//  Base.swift
//  Aehopark
//
//  Created by wodnd on 7/16/24.
//

import Foundation

struct EmptyResponseModel: Codable {
    
}

struct BaseResponse<T: Codable>: Codable {
    let status: Int
    let message: String
    let data: T?
    
    enum CodingKeys: String, CodingKey {
        case status
        case message
        case data
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.status = try container.decode(Int.self, forKey: .status)
        self.message = try container.decode(String.self, forKey: .message)
        self.data = try container.decodeIfPresent(T.self, forKey: .data)
    }
}
