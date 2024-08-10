//
//  ProductModel.swift
//  Aehopark
//
//  Created by Suin Kim on 8/10/24.
//

import Foundation

struct ManagedProduct: Identifiable {
    let id = UUID()
    let name: String
    let location: String
    let date: String
    let price: Int
}
