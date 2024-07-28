//
//  Finish.swift
//  Aehopark
//
//  Created by 문창재 on 7/14/24.
//

import SwiftUI

struct FinishView: View {
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Text("애호박박 님\n회원가입을 축하드립니다!")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }.padding()
                
                Spacer()
                
                Image("AehoPark_Character")
                    .resizable()
                    .scaledToFit()
                    .padding()
                
                Spacer()
                
                nextButton
                    .padding()
                
            }.navigationTitle("")
                .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .toolbar(content: {
                Spacer()
            })
        }
    }
    
    var nextButton: some View{
        NavigationLink {
            AehoparkTabView()
                .navigationBarBackButtonHidden()
        } label: {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: UIScreen.main.bounds.width * 0.8 , height: UIScreen.main.bounds.height * 0.07)
                .foregroundStyle(._377_D_00)
                .overlay {
                    Text("시작하기")
                        .foregroundStyle(Color.white)
                }
        }
    }
}

#Preview {
    FinishView()
}
