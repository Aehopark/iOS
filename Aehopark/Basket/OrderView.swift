//
//  OrderView.swift
//  Aehopark
//
//  Created by Suin Kim on 7/21/24.
//

//import SwiftUI
//
//struct OrderView: View {
//    @State var products: [Product]
//    @State private var selectedPaymentMethod = "신용카드"
//    @State private var isAgreedToTerms = false
//    let paymentMethods = ["신용카드", "무통장입금", "휴대폰결제"]
//    
//    var totalPrice: Int {
//        products.reduce(0) { $0 + ($1.discountPrice ?? $1.price) * $1.quantity }
//    }
//    
//    var body: some View {
//        ScrollView {
//            VStack(alignment: .leading, spacing: 16) {
//                // 주문 상품
//                Text("주문 상품")
//                    .font(.Roboto(.semibold, size: 14))
//                    .padding([.leading, .top], 24)
//                
//                ForEach(products, id: \.id) { product in
//                    OrderListCellView(product: product)
//                }
//                
//                Rectangle()
//                    .fill(Color.gray.opacity(0.2))
//                    .frame(height: 8)
//                
//                HStack {
//                    Text("주문자 정보")
//                        .font(.Roboto(.semibold, size: 14))
//                    Text("애호박,")
//                        .font(.Roboto(.medium, size: 14))
//                    Text("010-0000-0000")
//                        .font(.Roboto(.semibold, size: 14))
//                }
//                .padding(.horizontal, 24)
//                
//                Rectangle()
//                    .fill(Color.gray.opacity(0.2))
//                    .frame(height: 8)
//                
//                // 배송지
//
//                
//                // 결제 수단
//                Text("결제 수단")
//                    .font(.Roboto(.semibold, size: 14))
//                    .padding(.leading, 16)
//                
//                Picker(selection: $selectedPaymentMethod, label: Text("")) {
//                    ForEach(paymentMethods, id: \.self) {
//                        Text($0)
//                    }
//                }
//                .pickerStyle(SegmentedPickerStyle())
//                .padding([.leading, .trailing], 16)
//                
//                // 약관 동의
//                HStack {
//                    Button(action: {
//                        isAgreedToTerms.toggle()
//                    }) {
//                        Image(systemName: isAgreedToTerms ? "checkmark.square.fill" : "square")
//                            .foregroundColor(isAgreedToTerms ? Color("377D00") : .gray)
//                    }
//                    Text("결제 약관에 동의합니다")
//                        .font(.Roboto(.regular, size: 12))
//                }
//                .padding(16)
//                
//                // 결제하기 버튼
//                Button(action: {
//                    // 결제하기 로직
//                }) {
//                    Text("\(totalPrice)원 결제하기")
//                        .font(.Roboto(.semibold, size: 16))
//                        .foregroundColor(.white)
//                        .padding()
//                        .frame(maxWidth: .infinity)
//                        .background(Color("377D00"))
//                        .cornerRadius(8)
//                }
//                .padding([.leading, .trailing, .bottom], 16)
//            }
//            .background(Color("F8F8F8"))
//        }
//        .navigationTitle("주문 / 결제")
//        .navigationBarTitleDisplayMode(.inline)
//    }
//}
//
//struct OrderView_Previews: PreviewProvider {
//    static var previews: some View {
//        OrderView(products: [
//            Product(company: "회사1", title: "상품 1", discription: "", price: 10000, discountPrice: 8000, discountPercentage: 20, quantity: 1),
//            Product(company: "회사2", title: "상품 2", discription: "", price: 20000, quantity: 2),
//            Product(company: "회사3", title: "상품 3", discription: "", price: 30000, discountPrice: 25000, discountPercentage: 16, quantity: 3)
//        ])
//    }
//}
import SwiftUI

struct OrderView: View {
    @State var products: [Product]
    @State var totalPrice: Int
    @State var totalDiscount: Int
    @State var totalFee: Int
    @State var totalAmount: Int
    @State private var selectedPaymentMethod = "신용카드"
    @State private var isAgreedToTerms = false
    @State private var showOrdererInfo = false
    @State private var showAddressModal = false
    @State private var deliveryRequest = ""
    let paymentMethods = ["신용카드", "무통장입금", "휴대폰결제"]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // 주문 상품
                Text("주문 상품")
                    .font(.Roboto(.semibold, size: 14))
                    .padding([.leading, .top], 24)
                
                ForEach(products, id: \.id) { product in
                    OrderListCellView(product: product)
                }
                
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 8)
                
                // 주문자 정보
                VStack(alignment: .leading) {
                    HStack {
                        Text("주문자 정보")
                            .font(.Roboto(.semibold, size: 14))
                        Spacer()
                        Button(action: {
                            withAnimation {
                                showOrdererInfo.toggle()
                            }
                        }) {
                            Image(systemName: showOrdererInfo ? "chevron.up" : "chevron.down")
                                .foregroundColor(.black)
                        }
                    }
                    .padding(.horizontal, 24)
                    
                    if showOrdererInfo {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("보내는 분: 애호박")
                                .font(.Roboto(.regular, size: 14))
                            Text("휴대폰 번호: 010-0000-0000")
                                .font(.Roboto(.regular, size: 14))
                            HStack {
                                Text("이메일: example@example.com")
                                    .font(.Roboto(.regular, size: 14))
                                Spacer()
                                NavigationLink(destination: MypageView()) {
                                    Text("내 정보 변경")
                                        .font(.Roboto(.regular, size: 12))
                                        .foregroundColor(.blue)
                                }
                            }
                        }
                        .padding(.horizontal, 24)
                    }
                }
                
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 8)
                
                // 배송지
                VStack(alignment: .leading) {
                    HStack {
                        Text("배송지")
                            .font(.Roboto(.semibold, size: 14))
                        Spacer()
                        Button(action: {
                            showAddressModal.toggle()
                        }) {
                            Text("변경")
                                .font(.Roboto(.regular, size: 14))
                                .foregroundColor(.blue)
                        }
                        .sheet(isPresented: $showAddressModal) {
                            Text("배송지 변경 모달")
                                .font(.title)
                                .padding()
                        }
                    }
                    .padding(.horizontal, 24)
                    Text("서울특별시 강남구 테헤란로 123")
                        .font(.Roboto(.regular, size: 14))
                        .padding(.horizontal, 24)
                }
                
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 8)
                
                // 배송 요청 사항
                VStack(alignment: .leading) {
                    Text("배송 요청 사항")
                        .font(.Roboto(.semibold, size: 14))
                        .padding(.horizontal, 24)
                    
                    TextField("배송 요청사항이 있다면 적어주세요", text: $deliveryRequest)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).stroke(deliveryRequest.isEmpty ? Color.gray.opacity(0.5) : Color.gray, lineWidth: 1))
                        .padding(.horizontal, 24)
                }
                
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 8)
                
                // 결제 금액
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("총 상품금액")
                            .font(.Roboto(.regular, size: 18))
                        Spacer()
                        Text("\(totalPrice) 원")
                            .font(.Roboto(.regular, size: 18))
                    }
                    
                    HStack {
                        Text("총 할인금액")
                            .font(.Roboto(.regular, size: 18))
                        Spacer()
                        Text("\(totalDiscount) 원")
                            .font(.Roboto(.regular, size: 18))
                    }
                    
                    HStack {
                        Text("총 배송비")
                            .font(.Roboto(.regular, size: 18))
                        Spacer()
                        Text("1000 원")
                            .font(.Roboto(.regular, size: 18))
                    }
                    
                    HStack {
                        Text("수수료")
                            .font(.Roboto(.regular, size: 18))
                        Spacer()
                        Text("5%")
                            .font(.Roboto(.regular, size: 18))
                    }
                    
                    Divider()
                        .frame(height: 10)
                    
                    HStack {
                        Text("결제 예정 금액:")
                            .font(.Roboto(.regular, size: 18))
                        Spacer()
                        Text("\(totalAmount) 원")
                            .font(.Roboto(.semibold, size: 18))
                    }
                }
                .padding(.horizontal, 28)
                .padding(.bottom, 10)
                
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 8)
                
                // 결제 수단
                Text("결제 수단")
                    .font(.Roboto(.semibold, size: 14))
                    .padding(.horizontal, 24)
                
                Picker(selection: $selectedPaymentMethod, label: Text("")) {
                    ForEach(paymentMethods, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal, 24)
                
                // 약관 동의
                HStack {
                    Button(action: {
                        isAgreedToTerms.toggle()
                    }) {
                        Image(systemName: isAgreedToTerms ? "checkmark.square.fill" : "square")
                            .foregroundColor(isAgreedToTerms ? Color("377D00") : .gray)
                    }
                    Text("결제 약관에 동의합니다")
                        .font(.Roboto(.regular, size: 12))
                }
                .padding(24)
                
                // 결제하기 버튼
                Button(action: {
                    // 결제하기 로직
                }) {
                    Text("\(totalAmount)원 결제하기")
                        .font(.Roboto(.semibold, size: 16))
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("377D00"))
                        .cornerRadius(8)
                }
                .padding([.leading, .trailing, .bottom], 16)
            }
            .background(Color("F8F8F8"))
        }
        .navigationTitle("결제")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(products: [
            Product(company: "회사1", title: "상품 1", discription: "", price: 10000, discountPrice: 8000, discountPercentage: 20, quantity: 1),
            Product(company: "회사2", title: "상품 2", discription: "", price: 20000, quantity: 2),
            Product(company: "회사3", title: "상품 3", discription: "", price: 30000, discountPrice: 25000, discountPercentage: 16, quantity: 3)
        ], totalPrice: 60000, totalDiscount: 10000, totalFee: 3000, totalAmount: 53000) // 예시 값
    }
}
