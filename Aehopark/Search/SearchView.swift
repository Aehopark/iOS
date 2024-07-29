//
//  SearchView.swift
//  Aehopark
//
//  Created by wodnd on 7/15/24.
//

import SwiftUI

enum Category: String, CaseIterable, Codable {
    case all // 전체
    case vegetables // 채소류
    case eggs  // 계란류
    case fruit  // 과일류
    case fisheries  // 수산물
    case cereals  // 곡물류
    case dairyProducts // 유제품류
}

struct SearchView: View {
    
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = ._377_D_00
        UIPageControl.appearance().pageIndicatorTintColor = UIColor._999999
    }
    
    @State var categories: [(key: String, value: String)] = [
        ("야채류", "야채류"),
        ("정육계란류", "정육/계란류"),
        ("과일류", "과일류"),
        ("수산물건어물", "수산물/건어물"),
        ("곡물류", "곡물류"),
        ("유제품", "유제품")
    ]
    var categoryLayout: [GridItem] = [
        GridItem(.flexible())
    ]
    
    @State var searchTerm = ""
    @StateObject var searchVM: SearchViewModel = SearchViewModel()
    
    var body: some View {
        VStack {
            NavigationBar(title: "")
                .padding(.top, 22)
            
            SearchBarView(searchTerm: $searchTerm, disabled: false)
                .padding(.top, 30)
            
            HStack {
                Text("가격 비교를 위해 재료를 검색하세요")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(Color.gray)
                
                Spacer()
            }
            .padding(EdgeInsets(top: 10, leading: 35, bottom: 0, trailing: 0))
            
            TabView {
                ForEach(0..<((categories.count + 2) / 3)) { index in
                    LazyHGrid(rows: categoryLayout) {
                        ForEach(0..<3) { subIndex in
                            let actualIndex = index * 3 + subIndex
                            if actualIndex < categories.count {
                                let category = categories[actualIndex]
                                Button {
                                    
                                } label: {
                                    CategoryView(imageName: category.key, categoryName: category.value)
                                }

                            }
                        }
                    }
                    .padding(.horizontal, 35)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .frame(height: 180)
            .padding(.top, -20)
            
            if searchVM.state.allResponse.all.totalElemnets != 0 {
                HStack{
                    Text("재료이름")
                        .font(.Roboto(.semibold, size: 20))
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        HStack{
                            Text("더보기")
                                .font(.Roboto(.regular, size: 12))
                                .foregroundColor(._767676)
                            Image(systemName: "chevron.right")
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 3, height: 6)
                                .foregroundColor(._767676)
                                .padding(.leading, -5)
                        }
                    })
                }
                .padding(EdgeInsets(top: 20, leading: 24, bottom: 0, trailing: 24))
            } else {
                VStack{
                    
                    Image("icNoResult")
                    
                    Text("앗 찾으시는 검색 결과가 없네요.")
                        .font(.Roboto(.semibold, size: 20))
                        .foregroundColor(.black)
                }
                .padding(.top, 100)
                
            }
            
            Spacer()
        }
        .toolbar(.hidden)
    }
}

#Preview {
    SearchView()
}
