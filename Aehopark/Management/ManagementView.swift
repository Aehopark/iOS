//
//  ProductModel.swift
//  Aehopark
//
//  Created by Suin Kim on 8/10/24.
//

import SwiftUI

struct ManagementView: View {
    @State private var products: [ManagedProduct] = [
        ManagedProduct(name: "상품1", location: "서울", date: "3일 전", price: 20000),
        ManagedProduct(name: "상품2", location: "부산", date: "2일 전", price: 15000),
        ManagedProduct(name: "상품3", location: "대구", date: "1일 전", price: 10000)
    ]
    
    @State private var selectedSegment = 0
    @State private var sortOrder = "최신순"
    
    var body: some View {
        NavigationView {
            VStack {
                // 타이틀 및 프로필 이미지
                HStack {
                    Text("나의 판매상품")
                        .font(.Roboto(.semibold, size: 20))
                        .padding(.leading, 24)
                    
                    Spacer()
                    
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 58, height: 58)
                        .clipShape(Circle())
                        .padding(.trailing, 24)
                    
                }
                .padding(.top, 16)
                
                // 검색바
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color("377D00"))
                        .padding(.leading, 12)
                    
                    TextField("상품을 검색해보세요", text: .constant(""))
                        .padding(8)
                    
                    Button(action: {
                        // 마이크 기능
                    }) {
                        Image(systemName: "mic.fill")
                            .foregroundColor(Color("377D00"))
                            .padding(.trailing, 16)
                    }
                }
                .background(Color(.DBDBDB))
                .cornerRadius(10)
                .padding(.horizontal, 24)
                .padding(.top, 24)
                
                // Picker
                HStack {
                    Button(action: {
                        selectedSegment = 0
                    }) {
                        Text("판매중 \(products.count)")
                            .foregroundColor(selectedSegment == 0 ? Color("377D00") : .black)
                            .underline(selectedSegment == 0, color: Color("377D00"))
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        selectedSegment = 1
                    }) {
                        Text("거래완료 \(products.count)")
                            .foregroundColor(selectedSegment == 1 ? Color("377D00") : .black)
                            .underline(selectedSegment == 1, color: Color("377D00"))
                    }
                }
                .padding(.horizontal, 24)
                .padding(.top, 16)
                
                // 최신순 텍스트 및 메뉴
                HStack {
                    Menu {
                        Button(action: { sortOrder = "최신순" }) {
                            Text("최신순")
                        }
                        Button(action: { sortOrder = "인기순" }) {
                            Text("인기순")
                        }
                        Button(action: { sortOrder = "가격 높은 순" }) {
                            Text("가격 높은 순")
                        }
                        Button(action: { sortOrder = "가격 낮은 순" }) {
                            Text("가격 낮은 순")
                        }
                    } label: {
                        HStack {
                            Text(sortOrder)
                                .foregroundColor(.black)
                            Image(systemName: "chevron.down")
                                .foregroundColor(.black)
                        }
                    }
                    .padding(.trailing, 2)
                    .padding(.top, 4)
                    
                    Spacer()
                }
                .padding(.leading, 24)
                
                // 상품 리스트
                List(products) { product in
                    ProductCellView(product: product)
                }
                .listStyle(.plain)
            }
            .navigationBarHidden(true)
        }
    }
}

struct ManagementView_Previews: PreviewProvider {
    static var previews: some View {
        ManagementView()
    }
}

