//
//  HomeView.swift
//  Aehopark
//
//  Created by wodnd on 7/14/24.
//

import SwiftUI

struct HomeView: View {
    
    var layout: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    @EnvironmentObject var viewModel: HomeViewModel
    
    var body: some View {
        GeometryReader { geo in
            VStack{
                
                HStack{
                    Text("Aehopark")
                        .font(.SansitaOne(size: 25))
                        .foregroundColor(._377_D_00)
                        .padding(EdgeInsets(top: 22, leading: 24, bottom: 0, trailing: 0))
                    Spacer()
                }
                
                SearchBarView(searchTerm: .constant(""), disabled: true)
                    .simultaneousGesture(TapGesture().onEnded {
                        AppState.shared.navigationPath.append(HomeViewType.searh)
                    })
                
                HStack{
                    Text("가격 비교를 위해 재료를 검색하세요")
                        .font(.Roboto(.regular, size: 14))
                        .foregroundColor(._767676)
                        .padding(EdgeInsets(top: 10, leading: 24, bottom: 0, trailing: 0))
                    
                    Spacer()
                }
                
                ScrollView{
                    BannerView()
                        .frame(width: geo.size.width * 1, height: geo.size.height * 0.35)
                        
                    HStack{
                        Text("추천 상품")
                            .font(.Inter(.semibold, size: 20))
                            .foregroundColor(.black)
                            .padding(EdgeInsets(top: 10, leading: 24, bottom: 0, trailing: 0))
                        
                        Spacer()
                    }
                    HStack{
                        Text("👍 금주의 추천 목록")
                            .font(.Inter(.semibold, size: 24))
                            .padding(EdgeInsets(top: 5, leading: 24, bottom: 0, trailing: 0))
                        Spacer()
                    }
                    
                    LazyVGrid(columns: layout, content: {
                        ForEach(viewModel.state.getRecommendItemResponse.recommendItems, id: \.id) { item in
                            ArticleItem(viewModel: item)
                        }
                    })
                    .padding()
                }
                
                Spacer()
            }
            .navigationDestination(for: HomeViewType.self) { home in
                switch home{
                case .searh:
                    SearchView()
                }
            }
        }
    }
}

enum HomeViewType {
    case searh
}


#Preview {
    HomeView()
        .environmentObject(HomeViewModel())
}
