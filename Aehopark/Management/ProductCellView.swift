//
//  ProductModel.swift
//  Aehopark
//
//  Created by Suin Kim on 8/10/24.
//

import SwiftUI

struct ProductCellView: View {
    let product: ManagedProduct
    
    var body: some View {
        HStack {
            Image(systemName: "photo")
                .resizable()
                .frame(width: 114, height: 114)
                .background(Color.gray)
                .cornerRadius(5)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(product.name)
                    .font(.Roboto(.medium, size: 14))
                
                HStack(spacing: 5) {
                    Text(product.location)
                        .font(.Roboto(.medium, size: 12))
                        .foregroundColor(.gray)
                    
                    Text("·")
                        .font(.Roboto(.medium, size: 12))
                        .foregroundColor(.gray)
                    
                    Text(product.date)
                        .font(.Roboto(.medium, size: 12))
                        .foregroundColor(.gray)
                }
                
                Text("\(product.price)원")
                    .font(.Roboto(.semibold, size: 14))
                    .padding(.bottom, 3)
                
                HStack {
                    Button(action: {
                        // 게시글 수정 기능
                    }) {
                        Text("게시글 수정")
                            .font(.Roboto(.medium, size: 10))
                            .foregroundColor(.black)
                            .padding(6)
                            .background(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                    }
                    
                    Button(action: {
                        // 게시글 삭제 기능
                    }) {
                        Text("게시글 삭제")
                            .font(.Roboto(.medium, size: 10))
                            .foregroundColor(.black)
                            .padding(6)
                            .background(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                    }
                }
            }
            .padding(.leading, 10)
            
            Spacer()
        }
        .padding()
    }
}

struct ProductCellView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCellView(product: ManagedProduct(name: "상품명", location: "위치", date: "7일 전", price: 10000))
            .previewLayout(.sizeThatFits)
    }
}
