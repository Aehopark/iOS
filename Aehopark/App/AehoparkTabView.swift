//
//  AehoparkTabView.swift
//  Aehopark
//
//  Created by wodnd on 7/15/24.
//

import SwiftUI
import SwiftUIIntrospect

enum Tab {
    case home, interest, basket, mypage
}

struct AehoparkTabView: View {
    
    @StateObject var appState = AppState.shared
    
    var body: some View {
        NavigationStack(path: $appState.navigationPath) {
            TabView(selection: $appState.currentTab) {
                HomeView()
                    .environmentObject(HomeViewModel())
                    .tabItem {
                        Label {
                            Text("홈")
                                .font(.Inter(.regular, size: 10))
                        } icon: {
                            if appState.currentTab == .home {
                                Image("icHomeFill")
                            } else {
                                Image("icHome")
                            }
                        }
                    }
                    .tag(Tab.home)
                FavoriteView()
                    .environmentObject(HomeViewModel())
                    .tabItem {
                        Label {
                            Text("관심상품")
                                .font(.Inter(.regular, size: 10))
                        } icon: {
                            if appState.currentTab == .interest {
                                Image("icWishFill")
                            } else {
                                Image("icWish")
                            }
                        }
                    }
                    .tag(Tab.interest)
                
                BasketView()
                    .tabItem {
                        Label {
                            Text("장바구니")
                                .font(.Inter(.regular, size: 10))
                        } icon: {
                            if appState.currentTab == .basket {
                                Image("icShoppingBagFill")
                            } else {
                                Image("icShoppingBag")
                            }
                        }
                    }
                    .tag(Tab.basket)
                
                MypageView()
                    .tabItem {
                        Label {
                            Text("마이페이지")
                                .font(.Inter(.regular, size: 10))
                        } icon: {
                            if appState.currentTab == .mypage {
                                Image("icMyPageFill")
                            } else {
                                Image("icMyPage")
                            }
                        }
                    }
                    .tag(Tab.mypage)
            }
            .tint(Color._377_D_00)
        }
        .toolbar(.hidden)
    }
}

#Preview {
    AehoparkTabView()
}
