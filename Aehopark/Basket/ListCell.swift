//
//  ListCell.swift
//  Aehopark
//
//  Created by Suin Kim on 7/18/24.
//

import SwiftUI

struct ListCell: View {
    @Binding var product: Product
    @Binding var isChecked: Bool
    var onDelete: () -> Void
    
    var body: some View {
        HStack(alignment: .top) {
            VStack {
                Button(action: {
                    isChecked.toggle()
                }) {
                    Image(systemName: isChecked ? "checkmark.square" : "square")
                        .foregroundColor(isChecked ? .green : .gray)
                        .frame(width: 21, height: 21)
                }
                .padding(.top, 10)
                
                Spacer()
            }
            .padding(.leading, 10)
            
            Image(systemName: "photo")
                .resizable()
                .frame(width: 80, height: 80)
                .background(Color.gray)
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(product.title)
                    .font(.headline)
                
                Text(product.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                HStack {
                    if let discountPrice = product.discountPrice {
                        Text("\(discountPrice) 원")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.red)
                        
                        Text("\(product.price) 원")
                            .font(.title3)
                            .fontWeight(.bold)
                            .strikethrough()
                            .foregroundColor(.gray)
                    } else {
                        Text("\(product.price) 원")
                            .font(.title3)
                            .fontWeight(.bold)
                    }
                }
                
                HStack {
                    Button(action: {
                        if product.quantity > 1 { product.quantity -= 1 }
                    }) {
                        Image(systemName: "minus.circle")
                            .foregroundColor(.red)
                    }
                    
                    Text("\(product.quantity)")
                        .padding(.horizontal)
                    
                    Button(action: {
                        product.quantity += 1
                    }) {
                        Image(systemName: "plus.circle")
                            .foregroundColor(.green)
                    }
                }
            }
            .padding(.leading, 10)
            
            Spacer()
            
            Button(action: onDelete) {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.red)
                    .frame(width: 21, height: 21)
            }
            .padding(.trailing, 10)
        }
        .padding(.vertical, 10)
    }
}

struct ListCell_Previews: PreviewProvider {
    @State static var product = Product(title: "상품명", description: "상품 설명", price: 10000, discountPrice: 8000, quantity: 1)
    @State static var isChecked = true
    
    static var previews: some View {
        ListCell(product: $product, isChecked: $isChecked, onDelete: {})
            .previewLayout(.sizeThatFits)
    }
}
