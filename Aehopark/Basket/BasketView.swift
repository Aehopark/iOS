//
//  BasketView.swift
//  Aehopark
//
//  Created by Suin Kim on 7/20/24.
//

import SwiftUI

struct BasketView: View {
    @State private var products = [
        Product(company: "회사1", title: "상품 1", discription: "", price: 10000, discountPrice: 8000, discountPercentage: 20, quantity: 1),
        Product(company: "회사2", title: "상품 2", discription: "", price: 20000, quantity: 2),
        Product(company: "회사3", title: "상품 3", discription: "", price: 30000, discountPrice: 25000, discountPercentage: 16, quantity: 3)
    ]
    @State private var isChecked = [true, true, true]
    @State private var feePercentage: Double = 5.0 // 수수료 비율
    
    var totalPrice: Int {
        zip(products, isChecked).reduce(0) { $0 + ($1.1 ? ($1.0.discountPrice ?? $1.0.price) * $1.0.quantity : 0) }
    }
    
    var totalDiscount: Int {
        zip(products, isChecked).reduce(0) { $0 + ($1.1 ? ($1.0.price - ($1.0.discountPrice ?? $1.0.price)) * $1.0.quantity : 0) }
    }
    
    var totalFee: Int {
        return Int(Double(totalPrice) * feePercentage / 100.0) // 수수료를 총 금액의 비율로 계산
    }
    
    var totalAmount: Int {
        return totalPrice - totalDiscount + totalFee
    }
    
    var checkedProducts: [Product] {
        return zip(products, isChecked).compactMap { $1 ? $0 : nil }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("장바구니")
                    .font(.Roboto(.semibold, size: 20))
                    .padding(.top, 20)
                
                if products.isEmpty {
                    Spacer()
                    Text("장바구니에 상품이 없습니다!")
                        .font(.Roboto(.regular, size: 18))
                        .foregroundColor(.gray)
                        .padding(.top, 20)
                    Spacer()
                } else {
                    ScrollView {
                        VStack {
                            HStack {
                                Button {
                                    let allSelected = !isChecked.allSatisfy { $0 }
                                    isChecked = Array(repeating: allSelected, count: isChecked.count)
                                } label: {
                                    Image(systemName: isChecked.allSatisfy { $0 } ? "checkmark.square.fill" : "square")
                                        .font(.system(size: 24))
                                        .foregroundColor(._377_D_00)
                                }
                                Text("모두 선택 (\(isChecked.filter { $0 }.count)/\(isChecked.count))")
                                    .font(.custom("Roboto-Regular", size: 16))
                                    .padding(.leading, 6)
                                Spacer()
                                
                                Button {
                                    for (index, checked) in isChecked.enumerated().reversed() {
                                        if checked {
                                            products.remove(at: index)
                                            isChecked.remove(at: index)
                                        }
                                    }
                                } label: {
                                    Text("선택 삭제")
                                        .font(.Roboto(.medium, size: 12))
                                        .foregroundStyle(Color.black)
                                        .padding(.trailing, 6)
                                }
                            }
                            .frame(width: 350, height: 28)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 8)
                            
                            Rectangle()
                                .fill(Color.gray.opacity(0.2))
                                .frame(height: 10)
                            
                            ForEach(Array(products.enumerated()), id: \.element.id) { index, product in
                                BasketListCellView(product: $products[index], isChecked: $isChecked[index]) {
                                    products.remove(at: index)
                                    isChecked.remove(at: index)
                                }
                                Rectangle()
                                    .fill(Color.gray.opacity(0.2))
                                    .frame(height: 3)
                            }
                            
                            Rectangle()
                                .fill(Color.gray.opacity(0.2))
                                .frame(height: 10)
                                .padding(.top, -10)
                            
                            Text("결제가 완료될 때까지 상품 구매 가능 여부 및 가격은 보장되지 않습니다")
                                .font(.Roboto(.medium, size: 8))
                                .foregroundColor(._999999)
                                .padding(.top, 4)
                                .padding(.bottom, 22)
                            
                            HStack {
                                Text("총 상품금액")
                                    .font(.Roboto(.regular, size: 18))
                                Spacer()
                                Text("\(totalPrice) 원")
                                    .font(.Roboto(.regular, size: 18))
                            }
                            .padding(.horizontal, 28)
                            .padding(.bottom, 10)
                            
                            HStack {
                                Text("총 할인금액")
                                    .font(.Roboto(.regular, size: 18))
                                Spacer()
                                Text("\(totalDiscount) 원")
                                    .font(.Roboto(.regular, size: 18))
                            }
                            .padding(.horizontal, 28)
                            .padding(.bottom, 10)
                            HStack {
                                Text("총 배송비")
                                    .font(.Roboto(.regular, size: 18))
                                Spacer()
                                Text("1000 원")
                                    .font(.Roboto(.regular, size: 18))
                            }
                            .padding(.horizontal, 28)
                            .padding(.bottom, 10)
                            
                            HStack {
                                Text("수수료")
                                    .font(.Roboto(.regular, size: 18))
                                Spacer()
                                Text("\(feePercentage, specifier: "%.f")%")
                                    .font(.Roboto(.regular, size: 18))
                            }
                            .padding(.horizontal, 28)
                            .padding(.bottom, 10)
                            
                            Divider()
                                .frame(height: 10)
                            
                            HStack {
                                Text("결제 예정 금액:")
                                    .font(.Roboto(.regular, size: 18))
                                Spacer()
                                Text("\(totalAmount) 원")
                                    .font(.Roboto(.semibold, size: 18))
                            }
                            .padding(.top, 10)
                            .padding(.horizontal, 28)
                            
                            // 추가된 Spacer로 ScrollView가 끝에 도달했을 때 고정되도록 함
                            Spacer(minLength: 1)
                        }
                    }
                    .padding()
                    
                    NavigationLink(destination: OrderView(products: checkedProducts, totalPrice: totalPrice, totalDiscount: totalDiscount, totalFee: totalFee, totalAmount: totalAmount)) { // 필요한 금액 정보를 전달
                        Text("\(totalAmount) 원 결제하기")
                            .font(.Roboto(.semibold, size: 16))
                            .padding()
                            .frame(width: 345, height: 50)
                            .background(Color._377_D_00)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding([.leading, .trailing, .bottom])
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct BasketView_Previews: PreviewProvider {
    static var previews: some View {
        BasketView()
    }
}
