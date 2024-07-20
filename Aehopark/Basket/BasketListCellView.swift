//
//  BasketListCellView.swift
//  Aehopark
//
//  Created by Suin Kim on 7/20/24.
//

import SwiftUI

struct BasketListCellView: View {
    @Binding var product: Product
    @Binding var isChecked: Bool
    var onDelete: () -> Void
    
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 10) {
                // 체크박스
                Button(action: {
                    isChecked.toggle()
                }) {
                    Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                        .foregroundColor(._377_D_00)
                        .font(.system(size: 24))
                        .background(Color.white)
                }
                .padding(.leading, 24)
                
                // 상품 이미지
                Image(systemName: "photo")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .background(Color.gray)
                    .padding(.leading, 2)
                
                // 상품 정보 및 수량 조절
                VStack(alignment: .leading) {
                    Text("[\(product.company)] \(product.title)")
                        .font(.Roboto(.medium, size: 12))
                        .padding(.bottom, 4)
                    
                    if let discountPrice = product.discountPrice, let discountPercentage = product.discountPercentage {
                        Text("\(product.price) 원")
                            .font(.Roboto(.semibold, size: 12))
                            .strikethrough()
                            .foregroundColor(.gray)
                        
                        Text("[\(discountPercentage)%] \(discountPrice) 원")
                            .font(.Roboto(.medium, size: 12))
                            .foregroundColor(Color("00520D"))
                        
                        Text("옵션변경 | 바로구매")
                            .font(.Roboto(.medium, size: 8))
                    } else {
                        Text("\(product.price) 원")
                            .font(.Roboto(.semibold, size: 12))
                    }
                }
                .padding(.leading, 8)
                
                Spacer()
                
                // 수량 조절 버튼 및 삭제 버튼
                VStack(alignment: .trailing) {
                    // 삭제 버튼
                    Button(action: onDelete) {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                            .frame(width: 21, height: 21)
                    }
                    Spacer()
                    
                    // 수량 조절 버튼
                    HStack(spacing: 0) {
                        Button(action: {
                            if product.quantity > 1 { product.quantity -= 1 }
                        }) {
                            Text("-")
                                .font(.Roboto(.semibold, size: 12))
                                .frame(width: 26, height: 26)
                                .background(Color.DBDBDB)
                                .foregroundColor(.black)
                                .border(Color._999999, width: 1)
                        }
                        
                        Text("\(product.quantity)")
                            .font(.Roboto(.semibold, size: 12))
                            .frame(width: 26, height: 26)
                            .border(Color._999999, width: 1)

                        Button(action: {
                            product.quantity += 1
                        }) {
                            Text("+")
                                .font(.Roboto(.semibold, size: 12))
                                .frame(width: 26, height: 26)
                                .background(Color.DBDBDB)
                                .foregroundColor(.black)
                                .border(Color._999999, width: 1)
                        }
                    }
                    .padding(.trailing, 24)
                }
                .padding(.trailing, 16)
            }
            .padding(.vertical, 16)
        }
    }
}

struct BasketListCellView_Previews: PreviewProvider {
    @State static var product = Product(company: "회사명", title: "상품명", price: 10000, discountPrice: 8000, discountPercentage: 20, quantity: 1)
    @State static var isChecked = true
    
    static var previews: some View {
        BasketListCellView(product: $product, isChecked: $isChecked, onDelete: {})
            .previewLayout(.sizeThatFits)
    }
}
