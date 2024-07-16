//
//  BannerView.swift
//  Aehopark
//
//  Created by wodnd on 7/15/24.
//

import SwiftUI
import Kingfisher

struct BannerView: View {
    private let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    @State private var index = 1
    @State private var selectedNum: String = ""
    private let images: [String] = ["ad1", "ad2", "ad3"]
    
    var body: some View {
        TabView(selection: $selectedNum){
            ForEach(images, id: \.self){ image in
                HStack{
                    Button {
                        switch image {
                        case "ad1":
                            AppState.shared.currentTab = .interest
                        case "ad2":
                            AppState.shared.currentTab = .basket
                        case "ad3":
                            AppState.shared.currentTab = .mypage
                        default:
                            break
                        }
                    } label: {
                        VStack{
                            switch image {
                            case "ad1": 
                                Text("관심상품으로 \n빠르게 확인을 해보아요!")
                                    .font(.RobotoMono(.regular, size: 20))
                                    .foregroundColor(._111111)
                                    .background(){
                                        Rectangle()
                                            .frame(width: 345, height: 208)
                                            .cornerRadius(20)
                                            .foregroundColor(._377_D_00.opacity(0.5))
                                    }
                            case "ad2":
                                Text("장바구니에 \n다양한 상품을 담아보아요!")
                                    .font(.RobotoMono(.regular, size: 20))
                                    .foregroundColor(._111111)
                                    .background(){
                                        Rectangle()
                                            .frame(width: 345, height: 208)
                                            .cornerRadius(20)
                                            .foregroundColor(._00520_D.opacity(0.5))
                                    }
                            case "ad3":
                                Text("마이페이지에서 \n나의 정보를 변경해보아요!")
                                    .font(.RobotoMono(.regular, size: 20))
                                    .foregroundColor(._111111)
                                    .background(){
                                        Rectangle()
                                            .frame(width: 345, height: 208)
                                            .cornerRadius(20)
                                            .foregroundColor(._90_A_344.opacity(0.5))
                                    }
                            default:
                                Text("배너 오류")
                            }
                        }
                    }

                }
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .onReceive(timer, perform: { _ in
            withAnimation {
                // index값을 증가, 아니면 1
                // (selectedNum의 값을 변경해주기 위함)
                index = index < images.count ? index + 1 : 1
                // selectedNum 값은 images 배열의 element 값
                selectedNum = images[index - 1]
            }
        })
        
    }
}


enum BannerViewType {
    case ad1
    case ad2
    case ad3
}

#Preview {
    BannerView()
}
