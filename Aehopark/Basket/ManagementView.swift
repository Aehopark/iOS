import SwiftUI

struct ManagementView: View {
    @State private var products: [ManagedProduct] = [
        ManagedProduct(name: "상품1", location: "서울", date: "3일 전", price: 20000),
        ManagedProduct(name: "상품2", location: "부산", date: "2일 전", price: 15000),
        ManagedProduct(name: "상품3", location: "대구", date: "1일 전", price: 10000)
    ]
    
    @State private var selectedSegment = 0
    @State private var sortOrder = "최신순"
    @State private var searchText = ""
    
    // 1. picker로 정렬 시 그에 맞는 조건들에 따라 정렬되어야 한다.
    private var sortedProducts: [ManagedProduct] {
        switch sortOrder {
        case "최신순":
            return products // 최신순으로 정렬 (이미 최신순으로 가정)
        case "인기순":
            return products // 인기순으로 정렬 (예제 데이터에 인기 정보가 없으므로 적용할 필요 없음)
        case "가격 높은 순":
            return products.sorted(by: { $0.price > $1.price })
        case "가격 낮은 순":
            return products.sorted(by: { $0.price < $1.price })
        default:
            return products
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                // 타이틀 및 프로필 이미지
                HStack {
                    Text("나의 판매상품")
                        .font(.system(size: 20, weight: .semibold))
                        .padding(.leading, 24)
                    
                    Spacer()
                    
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 58, height: 58)
                        .clipShape(Circle())
                        .padding(.trailing, 24)
                }
                .padding(.top, 16)
                
                // 검색바
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color("377D00"))
                        .padding(.leading, 12)
                    
                    TextField("상품을 검색해보세요", text: $searchText)
                        .padding(8)
                    
                    Button(action: {
                        // 3. 마이크 기능
                        activateMicrophone()
                    }) {
                        Image(systemName: "mic.fill")
                            .foregroundColor(Color("377D00"))
                            .padding(.trailing, 16)
                    }
                }
                .background(Color(.systemGray5))
                .cornerRadius(10)
                .padding(.horizontal, 16)
                .padding(.top, 16)
                
                // Picker
                HStack {
                    Button(action: {
                        selectedSegment = 0
                    }) {
                        VStack {
                            Text("판매중 \(products.count)")
                                .font(.Roboto(.semibold, size: 14))
                                .foregroundColor(selectedSegment == 0 ? Color("377D00") : .black)
                            Rectangle()
                                .frame(height: selectedSegment == 0 ? 2 : 0)
                                .foregroundColor(Color("377D00"))
                        }
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        selectedSegment = 1
                    }) {
                        VStack {
                            Text("거래완료 \(products.count)")
                                .font(.Roboto(.semibold, size: 14))
                                .foregroundColor(selectedSegment == 1 ? Color("377D00") : .black)
                            Rectangle()
                                .frame(height: selectedSegment == 1 ? 2 : 0)
                                .foregroundColor(Color("377D00"))
                        }
                    }
                }
                .padding(.horizontal, 24)
                .padding(.top, 16)
                
                // 최신순 텍스트 및 메뉴
                HStack {
                    Menu {
                        Button(action: { sortOrder = "최신순" }) {
                            Text("최신순")
                        }
                        Button(action: { sortOrder = "인기순" }) {
                            Text("인기순")
                        }
                        Button(action: { sortOrder = "가격 높은 순" }) {
                            Text("가격 높은 순")
                        }
                        Button(action: { sortOrder = "가격 낮은 순" }) {
                            Text("가격 낮은 순")
                        }
                    } label: {
                        HStack {
                            Text(sortOrder)
                                .font(.Roboto(.regular, size: 14))
                                .foregroundColor(.black)
                            Image(systemName: "chevron.down")
                                .frame(width: 12, height: 24)
                        }
                    }
                    .padding(.trailing, 2)
                    
                    Spacer()
                }
                .padding(.top, 4)
                .padding(.leading, 24)
                
                // 상품 리스트
                List {
                    ForEach(sortedProducts) { product in
                        ProductCellView(product: product)
                            .listRowSeparator(.hidden)
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationBarHidden(true)
        }
    }
    
    // 3. 마이크 활성화 기능
    private func activateMicrophone() {
        // 음성 인식 및 텍스트 변환 로직 추가
        // 예: Speech framework를 사용하여 음성 인식 구현
    }
}

struct ManagementView_Previews: PreviewProvider {
    static var previews: some View {
        ManagementView()
    }
}
