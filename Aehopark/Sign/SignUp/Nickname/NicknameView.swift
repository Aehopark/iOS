//
//  Nickname.swift
//  Aehopark
//
//  Created by 문창재 on 7/13/24.
//

import SwiftUI

struct NicknameView: View {
    @StateObject private var viewModel = NicknameViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    @State var isAPICall: Bool = false
    var body: some View {
        NavigationStack {
            VStack {
                VStack{
                    HStack {
                        Text("만나서 반가워요!\n어떻게 불러드리면 될까요?")
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                    }.padding()
                    
                }
                
                
                Spacer()
                
                VStack {
                    HStack {
                        TextField("닉네임을 입력해주세요", text: $viewModel.nicknameModel.nickname)
                            .textFieldStyle(.plain)
                            .keyboardType(.default)
                            .autocorrectionDisabled()
                        
                        Text("\(viewModel.nicknameModel.nickname.count) / 10")
                            .foregroundStyle(Color.gray)
                    }
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(viewModel.isNextButtonDisabled ? Color.gray : .green)
                    if viewModel.nicknameModel.nickname.containsSpecialCharacter(){
                        HStack{
                            Text("닉네임에는 한글, 영어, 숫자만 사용가능합니다.")
                                .font(.caption)
                                .foregroundStyle(Color.red)
                            Spacer()
                        }
                    }
                }.padding()
                
                Spacer()
                
                nextButton
                    .padding()
            }
            .navigationTitle("회원가입")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
    
    var nextButton: some View {
        Button {
            Task{
                await checkNicknameItem(nickname: viewModel.nicknameModel.nickname)
                isAPICall = true
                
                if viewModel.state.NicknameResponse == true {
                    print("닉네임 중복확인") //이후 코드 작성할것
                }
            }
        } label: {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.07)
                .foregroundStyle(viewModel.isNextButtonDisabled ? Color.gray : .green)
                .overlay {
                    Text("다 음")
                        .foregroundStyle(Color.white)
                }
        }.disabled(viewModel.isNextButtonDisabled)
    }
    
    func checkNicknameItem(nickname: String) async {
        await viewModel.action(.checkNickname(nickname: nickname))
    }
}

#Preview {
    NicknameView()
}

