//
//  OrderListCellView.swift
//  Aehopark
//
//  Created by Suin Kim on 7/22/24.
//

import SwiftUI

struct OrderListCellView: View {
    let product: Product
    
    var body: some View {
        HStack {
            Image(systemName: "photo")
                .resizable()
                .frame(width: 60, height: 60)
                .background(Color.gray)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(product.title)
                    .font(.Roboto(.regular, size: 12))
                Text("상품 설명")
                    .font(.Roboto(.regular, size: 10))
                    .foregroundColor(._999999)

                HStack {
                    if let discountPrice = product.discountPrice, let _ = product.discountPercentage {
                        
                        Text("\(discountPrice) 원")
                            .font(.Roboto(.semibold, size: 14))
                        
                    } else {
                        Text("\(product.price) 원")
                            .font(.Roboto(.semibold, size: 14))
                    }
                    Text("|  \(product.quantity)개")
                        .font(.Roboto(.semibold, size: 12))
                        .foregroundColor(._999999)
                    
                }
            }
            .padding(.leading, 8)

            Spacer()
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 8)
    }
}

struct OrderListCellView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListCellView(product: Product(company: "회사1", title: "상품 1", discription: "", price: 10000, discountPrice: 8000, discountPercentage: 20, quantity: 1))
            .previewLayout(.sizeThatFits)
    }
}
