//
//  DetailView.swift
//  Aehopark
//
//  Created by 윤성 on 7/26/24.
//

import SwiftUI
import Charts

struct DetailView: View {
    var name: String
    var categoryType: String
    var imageUrl: String
    
    @State private var PriceTrends: [PriceTrend] = [
      .init(date: "Nov 23", price: 10000),
      .init(date: "Nov 25", price: 9000),
      .init(date: "Nov 27", price: 15000),
      .init(date: "Nov 29", price: 12000),
      .init(date: "Nov 31", price: 16500)
    ]

    @State private var StoreTomato: [storeProduct] = [
        .init(id: "1", productPrice: 10000, productName: "달구나", productQuantity: "보통 1kg"),
        .init(id: "2", productPrice: 16000, productName: "천하일품", productQuantity: "특 1kg"),
        .init(id: "3", productPrice: 12000, productName: "아따달다", productQuantity: "상 1kg")
    ]
    @State private var PlatformTomato: [storeProduct] = [
        .init(id: "4", productPrice: 6500, productName: "이마트", productQuantity: "보통 0.6kg"),
        .init(id: "5", productPrice: 8000, productName: "올웨이즈", productQuantity: "특 0.5kg"),
        .init(id: "6", productPrice: 9900, productName: "마켓컬리", productQuantity: "보통 1kg")
    ]
    
    var body: some View {
        ScrollView{
            VStack {
                HStack{
                    Text("Aehopark")
                        .font(.SansitaOne(size: 25))
                        .foregroundColor(._90_A_344)
                        .padding(EdgeInsets(top: 22, leading: 24, bottom: 0, trailing: 0))
                    Spacer()
                }
                //Image(imageUrl)
                Image("AehoPark_Character")
                    .resizable()
                    .frame(width: 300,height: 200)
                
                HStack{
                    Text("\(name)")
                        .font(.Roboto(Font.roboto.medium, size: 25))
                        .padding(EdgeInsets(top: 10, leading: 24, bottom: 0, trailing: 0))
                        .foregroundStyle(.white)
                    Spacer()
                }
                HStack{
                    Text("\(categoryType)")
                        .font(.Roboto(Font.roboto.medium, size: 20))
                        .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 0))
                        .foregroundStyle(.white)
                    Spacer()
                }
                //가격: scroll
                PriceView()
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                
                //가격추세: graph
                HStack{
                    Text("가격 추세")
                        .font(.Roboto(Font.roboto.medium, size: 20))
                        .padding(EdgeInsets(top: 40, leading: 24, bottom: 0, trailing: 0))
                        .foregroundStyle(.white)
                    Spacer()
                }
                ZStack{
                    Chart {
                        ForEach(PriceTrends) { pri in
                            LineMark(
                                x: .value("Date", pri.date),
                                y: .value("Price", pri.price)
                            )
                        }
                    }
                    .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                    .frame(width: 300,height: 250)
                    .background(.white)
                    .background() {
                        Rectangle()
                            .frame(width: 330, height: 280)
                            .cornerRadius(5)
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                    }
                }
                
                //판매처: table
                HStack{
                    Text("판매처")
                        .font(.Roboto(Font.roboto.medium, size: 20))
                        .padding(EdgeInsets(top: 60, leading: 24, bottom: 0, trailing: 0))
                        .foregroundStyle(.white)
                    Spacer()
                }
                HStack{
                    Text("* 클릭 시 구매 페이지로 이동합니다")
                        .font(.Roboto(Font.roboto.regular, size: 13))
                        .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 0))
                        .foregroundStyle(.white)
                    Spacer()
                }
                //표
                Text("AehoPark 판매상품")
                    .font(.SansitaOne(size: 20))
                    .foregroundColor(.black)
                    .padding(EdgeInsets(top: 22, leading: 24, bottom: 0, trailing: 0))
                    .background() {
                        Rectangle()
                            .frame(width: 350, height: 50)
                            .cornerRadius(5)
                            .foregroundColor(._90_A_344)
                            .padding(EdgeInsets(top: 22, leading: 0, bottom: 0, trailing: 0))
                    }
                VStack{
                    HStack{
                        Text("브랜드")
                            .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                        Text("갯수/수량")
                            .padding(EdgeInsets(top: 10, leading: 5, bottom: 0, trailing: 0))
                        Text("가격")
                            .padding(EdgeInsets(top: 10, leading: 5, bottom: 0, trailing: 75))
                    }
                    .font(.Roboto(Font.roboto.semibold, size: 20))
                    
                    Divider()
                        .frame(width: 330)
                    
                    
                    ForEach(StoreTomato) { storepro in
                        StoreView(storeProduct: storepro)
                    }
                }
                .background(.white)
                .cornerRadius(3.0)
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                
                
                //플랫폼: table
                
                Text("플랫폼 판매처")
                    .font(.SansitaOne(size: 20))
                    .foregroundColor(.black)
                    .padding(EdgeInsets(top: 100, leading: 0, bottom: 0, trailing: 0))
                    .background() {
                        Rectangle()
                            .frame(width: 330, height: 50)
                            .cornerRadius(5)
                            .foregroundColor(._90_A_344)
                            .padding(EdgeInsets(top: 100, leading: 0, bottom: 0, trailing: 0))
                    }
                
                VStack{
                    ForEach(PlatformTomato) { platpro in
                        PlatformView(storeProduct: platpro)
                    }
                }
                .background(.white)
                .cornerRadius(3.0)
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                
                
                HStack{
                    Text("꼭 확인하세요!")
                        .font(.Roboto(Font.roboto.medium, size: 17))
                        .padding(EdgeInsets(top: 60, leading: 24, bottom: 0, trailing: 0))
                        .foregroundStyle(.white)
                    Spacer()
                }
                HStack{
                    Text("* 해당 플랫폼 식재료 가격은 플랫폼 내 판매량이 가장 많은 사위 10개의 평균 값입니다.")
                        .font(.Roboto(Font.roboto.medium, size: 14))
                        .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 0))
                        .foregroundStyle(.white)
                    Spacer()
                }
                
                Spacer()
            }
        }
        .background(._00520_D)
    }
}

struct PriceView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ZStack {
                    Rectangle()
                        .frame(width: 280, height: 100)
                        .cornerRadius(20)
                        .foregroundColor(.white)
                    VStack(alignment: .leading){
                        Text("표준가격")
                            .font(.Roboto(Font.roboto.medium, size: 15))
                            .foregroundStyle(.black)
                        Text("10000원")
                            .font(.Roboto(Font.roboto.medium, size: 25))
                        Text("+20% 1달 전보다")
                    }
                    .padding(EdgeInsets(top: 0, leading: -100, bottom: 0, trailing: 0))
                    .foregroundStyle(.black)
                }
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                ZStack {
                    Rectangle()
                        .frame(width: 280, height: 100)
                        .cornerRadius(20)
                        .foregroundColor(.white)
                    VStack(alignment: .leading){
                        Text("이번 달 최고가")
                            .font(.Roboto(Font.roboto.medium, size: 15))
                            .foregroundStyle(.black)
                        Text("20000원")
                            .font(.Roboto(Font.roboto.medium, size: 25))
                        Text("+33% 1달 전보다")
                    }
                    .padding(EdgeInsets(top: 0, leading: -100, bottom: 0, trailing: 0))
                    .foregroundStyle(.black)
                }
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
            }
        }
    }
}

struct StoreView: View {
    let storeProduct: storeProduct
    
    var body: some View {
        VStack{
            HStack{ //오&열 맞추기
                Text("\(storeProduct.productName)")
                    .padding(EdgeInsets(top: 5, leading: 25, bottom: 0, trailing: 0))
                Text("\(storeProduct.productQuantity)")
                    .padding(EdgeInsets(top: 5, leading: 15, bottom: 0, trailing: 0))
                Text("\(storeProduct.productPrice)원")
                    .padding(EdgeInsets(top: 5, leading: 15, bottom: 0, trailing: 0))
                NavigationLink(destination: BasketView()) { //판매페이지로 이동
                    Text("장바구니 담기")
                        .font(.Roboto(.regular, size: 12))
                        .foregroundColor(._90_A_344)
                }
                .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 30))
                
            }
            .font(.Roboto(Font.roboto.regular, size: 16))
            
            Divider()
                .frame(width: 330)
        }
    }
}
struct PlatformView: View {
    let storeProduct: storeProduct
    
    var body: some View {
        VStack{
            HStack{ //오&열 맞추기
                Text("\(storeProduct.productName)")
                    .padding(EdgeInsets(top: 10, leading: 15, bottom: 0, trailing: 0))
                Text("\(storeProduct.productQuantity)")
                    .padding(EdgeInsets(top: 10, leading: 15, bottom: 0, trailing: 0))
                Text("\(storeProduct.productPrice)원")
                    .padding(EdgeInsets(top: 10, leading: 15, bottom: 0, trailing: 0))
            }
            .font(.Roboto(Font.roboto.regular, size: 17))
            Divider()
                .frame(width: 330)
        }
    }
}



#Preview {
    DetailView(name: String(), categoryType: String(), imageUrl: String())
        .environmentObject(HomeViewModel())
}
