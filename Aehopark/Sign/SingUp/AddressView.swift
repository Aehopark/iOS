//
//  Address.swift
//  Aehopark
//
//  Created by 문창재 on 7/13/24.
//

import SwiftUI

struct AddressView: View {
    @Environment(\.presentationMode) var presentationMode
    
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
                    HStack{
                        Image(systemName: "magnifyingglass")
                        Text("주소를 검색하세요")
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray)
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
