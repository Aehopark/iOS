//
//  Nickname.swift
//  Aehopark
//
//  Created by 문창재 on 7/13/24.
//

import SwiftUI

struct NicknameView: View {
    
    @State private var nickname:String = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    var isNextButtonDisabled: Bool {
        return nickname.isEmpty
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                
                HStack{
                    Text("만나서 반가워요!\n어떻게 불러드리면 될까요?")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }.padding()
                
                Spacer()
                
                VStack{
                    HStack{
                        TextField("닉네임을 입력해주세요", text: $nickname)
                            .textFieldStyle(.plain)
                            .keyboardType(.default)
                            .autocorrectionDisabled()
                        //textfield 안열림
                        
                        
                        Text("\(nickname.count) / 10")
                            .foregroundStyle(Color.gray)
                    }
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(isNextButtonDisabled ? Color.gray : ._377_D_00)
                }.padding()
                
                
                Spacer()
                
                nextButton
                    .padding()
                
                
            }
            .navigationTitle("회원가입")
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
    
    
    var nextButton: some View{
        NavigationLink {
            ProfileView()
        } label: {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: UIScreen.main.bounds.width * 0.8 , height: UIScreen.main.bounds.height * 0.07)
                .foregroundStyle(isNextButtonDisabled ? Color.gray : ._377_D_00)
                .overlay {
                    Text("다 음")
                        .foregroundStyle(Color.white)
                }
        }.disabled(isNextButtonDisabled)
    }
}

#Preview {
    NicknameView()
}
