//
//  OrderView.swift
//  Aehopark
//
//  Created by Suin Kim on 7/21/24.
//

//import SwiftUI
import SwiftUI
import SafariServices

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
    @State private var showSafariView = false
    let paymentMethods = ["신용카드", "무통장입금", "휴대폰결제"]
    
    @State private var showPaymentSuccess = false
    @State private var showPaymentFailure = false
    
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
                        if !showOrdererInfo {
                            Text("애호박, 010-0000-0000")
                                .font(.Roboto(.regular, size: 14))
                        }
                        
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
                    .padding(.vertical, 6)
                    
                    if showOrdererInfo {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("보내는 분: 애호박")
                                .font(.Roboto(.regular, size: 14))
                            Text("휴대폰 번호: 010-0000-0000")
                                .font(.Roboto(.regular, size: 14))
                            Text("이메일: example@example.com")
                                .font(.Roboto(.regular, size: 14))
                                .tint(.black) // 이메일 색상 변경
                            NavigationLink(destination: MypageView()) {
                                Text("내 정보 변경")
                                    .underline()
                                    .font(.Roboto(.regular, size: 12))
                                    .tint(.DBDBDB)
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
                    Text("배송지")
                        .font(.Roboto(.semibold, size: 14))
                        .padding(.bottom, 12)
                    HStack {
                        VStack(alignment: .leading) {
                            Text("기본 배송지")
                                .font(.Roboto(.medium, size: 12))
                                .foregroundColor(.white)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(Color("377D00"))
                                .cornerRadius(6)
                            
                            Text("경남 진주시 진주대로 501, 301호")
                                .font(.Roboto(.regular, size: 14))
                                .padding(.top, 2)
                        }
                        Spacer()
                        Button(action: {
                            showAddressModal.toggle()
                        }) {
                            Text("변경")
                                .font(.Roboto(.medium, size: 14))
                                .foregroundColor(.DBDBDB)
                                .padding(12)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.DBDBDB, lineWidth: 1)
                                )
                        }
                        .sheet(isPresented: $showAddressModal) {
                            Text("배송지 변경 모달")
                                .font(.title)
                                .padding()
                        }
                    }
                }
                .padding(.horizontal, 24)
                
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 8)
                
                // 배송 요청 사항
                VStack(alignment: .leading) {
                    Text("배송 요청 사항")
                        .font(.Roboto(.medium, size: 14))
                        .padding(.bottom, 12)
                    
                    TextField("배송 요청사항이 있다면 적어주세요", text: $deliveryRequest)
                        .font(.Roboto(.medium, size: 12))
                        .foregroundColor(.DBDBDB)
                        .background(Color.clear)
                        .overlay(Rectangle().frame(height: 1).foregroundColor(deliveryRequest.isEmpty ? Color.gray.opacity(0.5) : Color.gray), alignment: .bottom)
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 8)
                
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 8)
                
                // 결제 금액
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("총 상품금액")
                            .font(.Roboto(.regular, size: 16))
                        Spacer()
                        Text("\(totalPrice) 원")
                            .font(.Roboto(.regular, size: 16))
                    }
                    
                    HStack {
                        Text("총 할인금액")
                            .font(.Roboto(.regular, size: 16))
                        Spacer()
                        Text("\(totalDiscount) 원")
                            .font(.Roboto(.regular, size: 16))
                    }
                    
                    HStack {
                        Text("총 배송비")
                            .font(.Roboto(.regular, size: 16))
                        Spacer()
                        Text("1000 원")
                            .font(.Roboto(.regular, size: 16))
                    }
                    
                    HStack {
                        Text("수수료")
                            .font(.Roboto(.regular, size: 16))
                        Spacer()
                        Text("5%")
                            .font(.Roboto(.regular, size: 16))
                    }
                    
                    Divider()
                        .frame(height: 10)
                    
                    HStack {
                        Text("결제 예정 금액:")
                            .font(.Roboto(.regular, size: 16))
                        Spacer()
                        Text("\(totalAmount) 원")
                            .font(.Roboto(.semibold, size: 16))
                    }
                }
                .padding(.horizontal, 28)
                .padding(.vertical, 12)
                
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
                    Text("전자지급 결제대행 서비스 이용약관 동의")
                        .font(.Roboto(.regular, size: 12))
                    
                    Spacer()
                    
                    Button(action: {
                        showSafariView.toggle()
                    }) {
                        Text("보기")
                            .font(.Roboto(.medium, size: 12))
                            .foregroundColor(Color("DBDBDB"))
                            .underline()
                            .padding(.leading, 8)
                    }
                    .sheet(isPresented: $showSafariView) {
                        SafariView(url: URL(string: "https://hickory-card-890.notion.site/af0cc617368c44ea84f5de62208d8f06")!)
                    }
                }
                .padding(24)
                
                // 결제하기 버튼
                Button(action: {
                    showAlert()
                }) {
                    Text("\(totalAmount)원 결제하기")
                        .font(.Roboto(.semibold, size: 16))
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(isAgreedToTerms ? Color("377D00") : Color.gray)
                        .cornerRadius(8)
                }
                .disabled(!isAgreedToTerms)
                .padding([.leading, .trailing, .bottom], 16)
                .background(Color("F8F8F8"))
            }
            .navigationTitle("결제")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func showAlert() {
        let alert = UIAlertController(title: nil, message: "결제 기능 업데이트 중입니다 🥹", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            if let rootViewController = windowScene.windows.first?.rootViewController {
                rootViewController.present(alert, animated: true, completion: nil)
            }
        }
    }
}

struct SafariView: UIViewControllerRepresentable {
    let url: URL
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {}
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(products: [
            Product(company: "회사1", title: "상품 1", discription: "", price: 10000, discountPrice: 8000, discountPercentage: 20, quantity: 1),
            Product(company: "회사2", title: "상품 2", discription: "", price: 20000, quantity: 2),
            Product(company: "회사3", title: "상품 3", discription: "", price: 30000, discountPrice: 25000, discountPercentage: 16, quantity: 3)
        ], totalPrice: 60000, totalDiscount: 10000, totalFee: 3000, totalAmount: 53000)
    }
}
