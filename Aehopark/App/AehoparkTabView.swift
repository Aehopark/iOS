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
                        } icon: {
                            if appState.currentTab == .home {
                                Image(systemName: "star.fill")
                            } else {
                                Image(systemName: "star.fill")
                            }
                        }
                    }
                    .tag(Tab.home)
                FavoriteView()
                    .tabItem {
                        Label {
                            Text("관심상품")
                        } icon: {
                            if appState.currentTab == .interest {
                                Image(systemName: "star.fill")
                            } else {
                                Image(systemName: "star.fill")
                            }
                        }
                    }
                    .tag(Tab.interest)
                
                BasketView()
                    .tabItem {
                        Label {
                            Text("장바구니")
                        } icon: {
                            if appState.currentTab == .basket {
                                Image(systemName: "star.fill")
                            } else {
                                Image(systemName: "star.fill")
                            }
                        }
                    }
                    .tag(Tab.basket)
                
                MypageView()
                    .tabItem {
                        Label {
                            Text("마이페이지")
                        } icon: {
                            if appState.currentTab == .mypage {
                                Image(systemName: "star.fill")
                            } else {
                                Image(systemName: "star.fill")
                            }
                        }
                    }
                    .tag(Tab.mypage)
            }
            .tint(Color._377_D_00)
        }
    }
}

#Preview {
    AehoparkTabView()
}
