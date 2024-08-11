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
    
    var layout: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = ._377_D_00
        UIPageControl.appearance().pageIndicatorTintColor = UIColor._999999
    }
    
    @State var categories: [(key: String, value: String)] = [
        ("icVegetable", "야채류"),
        ("icMeat", "정육/계란류"),
        ("icFruit", "과일류"),
        ("icFish", "수산물/건어물"),
        ("icGrain", "곡물류"),
        ("icMilk", "유제품")
    ]
    var categoryLayout: [GridItem] = [
        GridItem(.flexible())
    ]
    
    @State var searchTerm = ""
    @StateObject var viewModel: SearchViewModel = SearchViewModel()
    @State var allItemApi: Bool = false
    @State var searchApi: Bool = false
    @State var categoryApi: Bool = false
    @State var selectedCategoryIndex: Int? = nil
    @State var category_name: String = ""
    
    var body: some View {
        ScrollViewReader { scroll in
            VStack {
                NavigationBar(title: "")
                    .padding(.top, 22)
                
                SearchBarView(searchTerm: $searchTerm, disabled: false)
                    .padding(.top, 30)
                    .onChange(of: searchTerm) { newValue in
                        Task {
                            if categoryApi {
                                await getCategorySearchItem(category_name: category_name, ingredient_name: newValue)
                                allItemApi = false
                                searchApi = true
                                categoryApi = true
                                print("카테고리: \(category_name) 검색어: \(newValue)")
                            } else {
                                await getSearchItem(ingredient_name: newValue)
                                allItemApi = false
                                searchApi = true
                                categoryApi = false
                                print("검색어: \(newValue)")
                            }
                        }
                    }
                
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
                                        Task{
                                            await getCategoryItem(category_name: category.value)
                                            allItemApi = false
                                            searchApi = false
                                            categoryApi = true
                                            category_name = category.value
                                            searchTerm = ""
                                            print("카테고리: \(category.value)")
                                        }
                                        selectedCategoryIndex = actualIndex
                                    } label: {
                                        CategoryView(imageName: category.key, categoryName: category.value, isSelected: Binding(
                                            get: { selectedCategoryIndex == actualIndex },
                                            set: { _ in selectedCategoryIndex = actualIndex }
                                        ))
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
                
                if allItemApi {
                    if viewModel.state.getAllItemResponse.count != 0 {
                        ScrollView{
                            HStack{
                                Text("재료이름")
                                    .font(.Roboto(.semibold, size: 20))
                                    .foregroundColor(.black)
                                    .padding(.leading, 25)
                                
                                Spacer()
                            }
                            
                            LazyVGrid(columns: layout, content: {
                                ForEach(viewModel.state.getAllItemResponse, id: \.id) { item in
                                    ArticleItem(viewModel: item)
                                        .padding(.bottom, 10)
                                }
                            })
                            
                            .padding(EdgeInsets(top: 20, leading: 24, bottom: 0, trailing: 24))
                        }.id("Scroll_To_Top")
                            .overlay(
                                
                                Button(action: {
                                    // 10. withAnimation 과함께 함수 작성
                                    withAnimation(.default) {
                                        // ScrollViewReader의 proxyReader을 넣어줌
                                        scroll.scrollTo("Scroll_To_Top", anchor: .top)
                                    }
                                    
                                }, label: {
                                    VStack{
                                        Spacer()
                                        
                                        HStack{
                                            Spacer()
                                            
                                            Image("icScrollToTop")
                                                .padding()
                                        }
                                    }
                                })
                            )
                    } else {
                        VStack{
                            
                            Image("icNoResult")
                            
                            Text("앗 찾으시는 검색 결과가 없네요.")
                                .font(.Roboto(.semibold, size: 20))
                                .foregroundColor(.black)
                        }
                        .padding(.top, 100)
                        
                    }
                }
                
                if searchApi == true && categoryApi == false {
                    Text("검색화면: \(searchTerm)")
                    //                    if viewModel.state.getAllItemResponse.result.count != 0 {
                    //                        ScrollView{
                    //                            HStack{
                    //                                Text("재료이름")
                    //                                    .font(.Roboto(.semibold, size: 20))
                    //                                    .foregroundColor(.black)
                    //
                    //                                Spacer()
                    //
                    //    //                            Button(action: {
                    //    //
                    //    //                            }, label: {
                    //    //                                HStack{
                    //    //                                    Text("더보기")
                    //    //                                        .font(.Roboto(.regular, size: 12))
                    //    //                                        .foregroundColor(._767676)
                    //    //                                    Image(systemName: "chevron.right")
                    //    //                                        .renderingMode(.template)
                    //    //                                        .resizable()
                    //    //                                        .frame(width: 3, height: 6)
                    //    //                                        .foregroundColor(._767676)
                    //    //                                        .padding(.leading, -5)
                    //    //                                }
                    //    //                            })
                    //                            }
                    //                            .padding(EdgeInsets(top: 20, leading: 24, bottom: 0, trailing: 24))
                    //                        }.id("Scroll_To_Top")
                    //                            .overlay(
                    //
                    //                                Button(action: {
                    //                                    // 10. withAnimation 과함께 함수 작성
                    //                                    withAnimation(.default) {
                    //                                        // ScrollViewReader의 proxyReader을 넣어줌
                    //                                        scroll.scrollTo("Scroll_To_Top", anchor: .top)
                    //                                    }
                    //
                    //                                }, label: {
                    //                                    VStack{
                    //                                        Spacer()
                    //
                    //                                        HStack{
                    //                                            Spacer()
                    //
                    //                                            Image("icScrollToTop")
                    //                                                .padding()
                    //                                        }
                    //                                    }
                    //                                })
                    //                            )
                    //                    } else {
                    //                        VStack{
                    //
                    //                            Image("icNoResult")
                    //
                    //                            Text("앗 찾으시는 검색 결과가 없네요.")
                    //                                .font(.Roboto(.semibold, size: 20))
                    //                                .foregroundColor(.black)
                    //                        }
                    //                        .padding(.top, 100)
                    //
                    //                    }
                }
                
                if categoryApi == true && searchApi == false {
                    Text("카테고리 화면: \(category_name)")
                    //                    if viewModel.state.getAllItemResponse.result.count != 0 {
                    //                        ScrollView{
                    //                            HStack{
                    //                                Text("재료이름")
                    //                                    .font(.Roboto(.semibold, size: 20))
                    //                                    .foregroundColor(.black)
                    //
                    //                                Spacer()
                    //
                    //    //                            Button(action: {
                    //    //
                    //    //                            }, label: {
                    //    //                                HStack{
                    //    //                                    Text("더보기")
                    //    //                                        .font(.Roboto(.regular, size: 12))
                    //    //                                        .foregroundColor(._767676)
                    //    //                                    Image(systemName: "chevron.right")
                    //    //                                        .renderingMode(.template)
                    //    //                                        .resizable()
                    //    //                                        .frame(width: 3, height: 6)
                    //    //                                        .foregroundColor(._767676)
                    //    //                                        .padding(.leading, -5)
                    //    //                                }
                    //    //                            })
                    //                            }
                    //                            .padding(EdgeInsets(top: 20, leading: 24, bottom: 0, trailing: 24))
                    //                        }.id("Scroll_To_Top")
                    //                            .overlay(
                    //
                    //                                Button(action: {
                    //                                    // 10. withAnimation 과함께 함수 작성
                    //                                    withAnimation(.default) {
                    //                                        // ScrollViewReader의 proxyReader을 넣어줌
                    //                                        scroll.scrollTo("Scroll_To_Top", anchor: .top)
                    //                                    }
                    //
                    //                                }, label: {
                    //                                    VStack{
                    //                                        Spacer()
                    //
                    //                                        HStack{
                    //                                            Spacer()
                    //
                    //                                            Image("icScrollToTop")
                    //                                                .padding()
                    //                                        }
                    //                                    }
                    //                                })
                    //                            )
                    //                    } else {
                    //                        VStack{
                    //
                    //                            Image("icNoResult")
                    //
                    //                            Text("앗 찾으시는 검색 결과가 없네요.")
                    //                                .font(.Roboto(.semibold, size: 20))
                    //                                .foregroundColor(.black)
                    //                        }
                    //                        .padding(.top, 100)
                    //
                    //                    }
                }
                
                if searchApi == true && categoryApi == true {
                    Text("카테고리: \(category_name) 검색: \(searchTerm)")
                    //                    if viewModel.state.getAllItemResponse.result.count != 0 {
                    //                        ScrollView{
                    //                            HStack{
                    //                                Text("재료이름")
                    //                                    .font(.Roboto(.semibold, size: 20))
                    //                                    .foregroundColor(.black)
                    //
                    //                                Spacer()
                    //
                    //    //                            Button(action: {
                    //    //
                    //    //                            }, label: {
                    //    //                                HStack{
                    //    //                                    Text("더보기")
                    //    //                                        .font(.Roboto(.regular, size: 12))
                    //    //                                        .foregroundColor(._767676)
                    //    //                                    Image(systemName: "chevron.right")
                    //    //                                        .renderingMode(.template)
                    //    //                                        .resizable()
                    //    //                                        .frame(width: 3, height: 6)
                    //    //                                        .foregroundColor(._767676)
                    //    //                                        .padding(.leading, -5)
                    //    //                                }
                    //    //                            })
                    //                            }
                    //                            .padding(EdgeInsets(top: 20, leading: 24, bottom: 0, trailing: 24))
                    //                        }.id("Scroll_To_Top")
                    //                            .overlay(
                    //
                    //                                Button(action: {
                    //                                    // 10. withAnimation 과함께 함수 작성
                    //                                    withAnimation(.default) {
                    //                                        // ScrollViewReader의 proxyReader을 넣어줌
                    //                                        scroll.scrollTo("Scroll_To_Top", anchor: .top)
                    //                                    }
                    //
                    //                                }, label: {
                    //                                    VStack{
                    //                                        Spacer()
                    //
                    //                                        HStack{
                    //                                            Spacer()
                    //
                    //                                            Image("icScrollToTop")
                    //                                                .padding()
                    //                                        }
                    //                                    }
                    //                                })
                    //                            )
                    //                    } else {
                    //                        VStack{
                    //
                    //                            Image("icNoResult")
                    //
                    //                            Text("앗 찾으시는 검색 결과가 없네요.")
                    //                                .font(.Roboto(.semibold, size: 20))
                    //                                .foregroundColor(.black)
                    //                        }
                    //                        .padding(.top, 100)
                    //
                    //                    }
                }
                
                Spacer()
            }
        }
        .toolbar(.hidden)
        .onAppear(){
            Task{
                await getAllItem()
                allItemApi = true
                searchApi = false
                categoryApi = false
            }
        }
    }
    
    func getAllItem() async {
        await viewModel.action(.getAllItem(page: 0))
    }
    
    func getSearchItem(ingredient_name: String) async {
        await viewModel.action(.getSearchItem(ingredient_name: ingredient_name, page: 0))
    }
    
    func getCategoryItem(category_name: String) async {
        await viewModel.action(.getCategoryItem(category_name: category_name, page: 0))
    }
    
    func getCategorySearchItem(category_name: String, ingredient_name: String) async {
        await viewModel.action(.getCategorySearchItem(category_name: category_name, ingredient_name: ingredient_name, page: 1))
    }
}

#Preview {
    SearchView()
}
