//
//  Data+.swift
//  Aehopark
//
//  Created by wodnd on 8/10/24.
//

import Foundation
import Alamofire

extension Foundation.Data {
    func decode<Item: Decodable, Decoder: DataDecoder>(type: Item.Type, decoder: Decoder = JSONDecoder()) throws -> Item {
        try decoder.decode(type, from: self)
    }
}
