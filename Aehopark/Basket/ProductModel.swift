//
//  ProductModel.swift
//  Aehopark
//
//  Created by Suin Kim on 7/20/24.
//

import Foundation

struct Product: Identifiable {
    var id = UUID()
    var company: String
    var title: String
    var price: Int
    var discountPrice: Int?
    var discountPercentage: Int?
    var quantity: Int
}
