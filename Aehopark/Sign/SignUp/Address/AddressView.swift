//
//  Address.swift
//  Aehopark
//
//  Created by 문창재 on 7/13/24.
//

import SwiftUI

struct AddressView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var viewModel = AddressViewModel()
    @State private var detailAddress = ""
    
    let postcodeURL = "https://changjaemun.github.io/DaumPostcodeServiceWeb/"
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Text("애호박박 님의 주소를 등록해주세요.")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }.padding()
                
                Spacer()
                
                VStack{
                    VStack{
                        NavigationLink{
                            WebView(url: URL(string: postcodeURL)!, viewModel: viewModel)
                            //url 옵셔널 언래핑
                                .navigationTitle("주소 검색")
                                .navigationBarTitleDisplayMode(.inline)
                        }label: {
                            HStack{
                                Image(systemName: "magnifyingglass")
                                    .foregroundStyle(._111111)
                                Text(viewModel.address == "" ? "주소를 검색하세요" : "\(viewModel.address)")
                                    .foregroundColor(viewModel.address == "" ? .gray : ._111111)
                                Spacer()
                            }
                        }
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.gray)
                    }.padding()
                    
                    if viewModel.address != ""{
                        VStack{
                            TextField("상세 주소를 입력해주세요", text: $detailAddress)
                                .textFieldStyle(.plain)
                                .keyboardType(.default)
                                .autocorrectionDisabled()
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(.gray)
                        }.padding(.horizontal)
                    }
                }.padding()
                
                Spacer()
                
                skipButton
                    .padding()
            }.navigationTitle("회원가입")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden()
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button{
                            presentationMode.wrappedValue.dismiss()
                        }label: {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.black)
                        }
                    }
                }
        }
        
    }
    
    var skipButton: some View{
        NavigationLink {
            TermsOfServiceView()
        } label: {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: UIScreen.main.bounds.width * 0.8 , height: UIScreen.main.bounds.height * 0.07)
                .foregroundStyle(._377_D_00)
                .overlay {
                    Text("건너뛰기")
                        .foregroundStyle(Color.white)
                }
        }
    }
}

#Preview {
    AddressView()
}
