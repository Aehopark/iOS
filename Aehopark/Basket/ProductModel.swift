//
//  ProductModel.swift
//  Aehopark
//
//  Created by Suin Kim on 7/20/24.
//

import Foundation

struct Product: Identifiable, Hashable {
    var id = UUID()
    var company: String
    var title: String
    var discription: String
    var price: Int
    var discountPrice: Int?
    var discountPercentage: Int?
    var quantity: Int
    
    init(id: UUID = UUID(), company: String, title: String, discription: String, price: Int, discountPrice: Int? = nil, discountPercentage: Int? = nil, quantity: Int) {
        self.id = id
        self.company = company
        self.title = title
        self.discription = discription
        self.price = price
        self.discountPrice = discountPrice
        self.discountPercentage = discountPercentage
        self.quantity = quantity
    }
}
