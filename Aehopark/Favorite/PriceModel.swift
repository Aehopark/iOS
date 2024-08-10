//
//  PriceModel.swift
//  Aehopark
//
//  Created by 윤성 on 8/9/24.
//

import Foundation

struct PriceTrend: Identifiable {
  let date: String
  let price: Int
  
  var id: String { date }
}

struct storeProduct: Identifiable {
    var id: String
    
    let productPrice: Int
    let productName: String
    let productQuantity: String
}

