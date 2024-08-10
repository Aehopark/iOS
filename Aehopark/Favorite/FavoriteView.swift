//
//  InterestView.swift
//  Aehopark
//
//  Created by wodnd on 7/15/24.
//

import SwiftUI

struct FavoriteView: View {
    
    var layout: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    @EnvironmentObject var viewModel: HomeViewModel
    
    var isLogin: Bool = true
    
    var body: some View {
        NavigationStack {
            if isLogin { // 로그인 상태일 때
                VStack {
                    HStack{
                        Text("나의 관심 상품")
                            .font(.Roboto(Font.roboto.semibold, size: 22))
                            .padding(EdgeInsets(top: 22, leading: 24, bottom: 0, trailing: 0))
                        Spacer()
                    }
                    ScrollView {
                        
                        HStack {
                            Text("OOO님이 최근 본 상품") //이름 입력받은 뒤 불러오기
                                .font(.Roboto(Font.roboto.semibold, size: 25))
                                .padding(EdgeInsets(top: 10, leading: 24, bottom: 0, trailing: 0))
                            Spacer()
                        }
                        ScrollView(.horizontal) {
                            LazyHStack { //최근 본 상품으로 변경 필요
                                ForEach(viewModel.state.getRecommendItemResponse.list.prefix(10), id: \.id) { item in
                                    ArticleItem(viewModel: item)
                                        .padding(EdgeInsets(top: 0, leading: 13, bottom: 0, trailing: 0))
                                }
                            }
                            .padding()
                        }
                        
                        HStack {
                            Text("OOO님이 찜한 상품") //이름 입력받은 뒤 불러오기
                                .font(.Roboto(Font.roboto.semibold, size: 25))
                                .padding(EdgeInsets(top: 10, leading: 24, bottom: 0, trailing: 0))
                            Spacer()
                        }
                        let favoriteItems = viewModel.state.getRecommendItemResponse.list.filter { $0.wishlist_status }
                        
                        if favoriteItems.isEmpty { // 짬한 상품이 없을 때
                            VStack {
                                Divider()
                                Spacer()
                                Text("찜한 상품이 없습니다!")
                                    .font(.Roboto(Font.roboto.medium, size: 25))
                                Text("마음에 드는 상품에 하트를 눌러 찜해보세요!")
                                    .foregroundStyle(.gray)
                                    .font(.Roboto(Font.roboto.medium, size: 15))
                                    .padding()
                                
                                Button(action: {
                                    // 액션 - 누르면 홈화면으로 이동
                                }, label: {
                                    Text("찜하러가기")
                                        .foregroundColor(.white)
                                        .padding(EdgeInsets(top: 15, leading: 100, bottom: 15, trailing: 100))
                                        .background(._377_D_00)
                                        .cornerRadius(10)
                                        .font(.Roboto(Font.roboto.semibold, size: 20))
                                    
                                })
                                Spacer()
                                
                            }
                            
                        } else { // 찜한 상품이 있을 때
                            LazyVGrid(columns: layout, content: {
                                ForEach(favoriteItems, id: \.id) { item in
                                    ArticleItem(viewModel: item)
                                        .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0))
                                }
                            })
                            .padding()
                            
                        }
                    }
                    Spacer()
                }
            } else { // 비회원 로그인일 때
                VStack {
                    
                    //이미지 추가
                    
                    Text("엇, 관심상품을 보려면 로그인이 필요해요!")
                        .font(.SansitaOne(.regular, size: 25))
                        .padding()
                        .multilineTextAlignment(.center)
                    
                    NavigationLink(destination: AehoparkTabView()){
                        Text("로그인 하러 가기")
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 15, leading: 100, bottom: 15, trailing: 100))
                            .background(._377_D_00)
                            .cornerRadius(10)
                            .font(.Roboto(.semibold, size: 20))
                    }
                    
//                    Button(action: {
//                        // 액션 - 누르면 홈화면으로 이동
//                    }, label: {
//                        Text("로그인 하러 가기")
//                            .foregroundColor(.white)
//                            .padding(EdgeInsets(top: 15, leading: 100, bottom: 15, trailing: 100))
//                            .background(._377_D_00)
//                            .cornerRadius(10)
//                            .font(.Roboto(.semibold, size: 20))
//                        
//                    })
                    
                }
            }
        }
        
    }
}

#Preview {
    FavoriteView()
        .environmentObject(HomeViewModel())
}

// 수정해야하는 부분
// 하트 눌렀을 때 찜한 상품에서 사라지도록 수정
// 찜하러가기 -> 뷰 이동 설정
// 이름 불러오기
// 최근 본 상품으로 보여주기
// 비회원로그인일 때 이미지 추가 해야함
