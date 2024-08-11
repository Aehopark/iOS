//
//  ArticleItem.swift
//  Aehopark
//
//  Created by wodnd on 7/16/24.
//

import SwiftUI
import Kingfisher

struct ArticleItem: View {
    let viewModel: ArticleItemModel
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .frame(width: 160, height: 250) // 너비를 고정
                    .clipShape(
                        .rect(
                            topLeadingRadius: 0,
                            bottomLeadingRadius: 12,
                            bottomTrailingRadius: 12,
                            topTrailingRadius: 12
                        )
                    )
                    .shadow(radius: 5)
                    .foregroundColor(.white)
                    .overlay {
                        VStack {
                            Spacer()
                            
                            HStack {
                                VStack {
                                    Text("\(viewModel.category)")
                                        .font(.Roboto(.regular, size: 14))
                                        .foregroundColor(._111111)
                                    Text("\(viewModel.ingredient)")
                                        .font(.Roboto(.semibold, size: 16))
                                        .foregroundColor(._111111)
                                }
                                .padding(EdgeInsets(top: 0, leading: 12, bottom: 44, trailing: 0))
                                
                                Spacer()
                            }
                        }
                        
                        VStack {
                            Spacer()
                            
                            HStack {
                                Spacer()
                                //appstate로 수정하기
                                Button(action: {
                                    AppState.shared.navigationPath.append(ArticleType.detail(name: viewModel.ingredient, categoryType: viewModel.category, imageUrl: viewModel.imageUrl!))
                                }, label: {
                                    Text("최저가 보러가기")
                                        .font(.Roboto(size: 12))
                                        .foregroundColor(._767676)
                                })
                                .padding()
                            }
                        }
                    }
                KFImage(URL(string: viewModel.imageUrl ?? ""))
                    .resizable()
                    .frame(width: 160, height: 160) // 너비를 고정
                    .background(.gray)
                    .clipShape(
                        .rect(
                            topLeadingRadius: 0,
                            bottomLeadingRadius: 0,
                            bottomTrailingRadius: 0,
                            topTrailingRadius: 12
                        )
                    )
                    .overlay(
                        ZStack {
                            VStack {
                                HStack {
                                    Text("Nature")
                                        .font(.RobotoMono(.regular, size: 12))
                                        .foregroundColor(.black)
                                        .background {
                                            Rectangle()
                                                .frame(width: 65, height: 24)
                                                .foregroundColor(._96_D_68_B)
                                                .clipShape(
                                                    .rect(
                                                        topLeadingRadius: 0,
                                                        bottomLeadingRadius: 0,
                                                        bottomTrailingRadius: 12,
                                                        topTrailingRadius: 0
                                                    )
                                                )
                                        }
                                        .padding(EdgeInsets(top: 4, leading: 10, bottom: 0, trailing: 0))
                                    Spacer()
                                }
                                Spacer()
                            }
                            
                            VStack {
                                Spacer()
                                
                                HStack {
                                    Spacer()
                                    
                                    Button(action: {
                                        //하트 선택/취소
                                        
                                    }) {
                                        Image(systemName: viewModel.wishlistStatus == 1 ? "heart.fill" : "heart")
                                            .renderingMode(.template)
                                            .background {
                                                Circle()
                                                    .frame(width: 30, height: 30)
                                                    .foregroundColor(.white)
                                            }
                                            .foregroundColor(viewModel.wishlistStatus == 1 ? ._377_D_00: Color.gray)
                                            .padding()
                                    }
                                }
                            }
                        }
                    )
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 90, trailing: 0))
            }
        }
        .frame(width: 160, height: 250) // 너비를 고정
        .navigationDestination(for: ArticleType.self) { article in
            switch article {
            case let .detail(name, categoryType, imageUrl):
                DetailView(name: name, categoryType: categoryType, imageUrl: imageUrl)
            }
        }
    }
}

enum ArticleType: Hashable {
    case detail(name: String, categoryType: String, imageUrl: String)
}

#Preview {
    ArticleItem(viewModel: ArticleItemModel(id: 0, category: "", ingredient: "", imageUrl: "", wishlistStatus: 0))
}
