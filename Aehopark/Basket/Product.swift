//
//  Product.swift
//  Aehopark
//
//  Created by Suin Kim on 7/18/24.
//

import Foundation

struct Product: Identifiable {
    var id = UUID()
    var title: String
    var description: String
    var price: Int
    var discountPrice: Int?
    var quantity: Int
}
