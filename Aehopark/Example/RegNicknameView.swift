//
//  RegNicknameView.swift
//  Aehopark
//
//  Created by 준호 on 7/15/24.
//

import SwiftUI

// MARK: - State
struct RegNicknameView {
    var provider: String
    var token: String
//    @StateObject private var authVM = AuthVM()
    
    @State var isActive = false
    
    @FocusState private var isTextFieldFocused: Bool
    @State private var nickname: String = ""
    @State private var errorMessage: String?
    @State private var isNicknameValid: Bool = false
    
    let topPadding: CGFloat = 72
    let BottomPadding: CGFloat = 24
    let horizontalPadding: CGFloat = 24
    
    let mainText = "만나서 반가워요!\n어떻게 불러드리면 될까요?"
    let subText  = ""
}

// MARK: - Frame
extension RegNicknameView: View {
    var body: some View {
        VStack {
            RegExplnTitle(mainText: mainText, subText: subText)
            ErrorMessageText(errorMessage: errorMessage)
            nicknameField
                .padding(.top, 152)
            Spacer()
            nextButton
        }
        .padding(.top, topPadding)
        .padding(.bottom, BottomPadding)
        .padding(.horizontal, horizontalPadding)
//        .onAppear {
//            userData.provider = provider
//            userData.accessToken = token
//        }
//        .onReceive(authVM.taskError) { errMsg in
//            errorMessage = errMsg
//            isNicknameValid = false
//        }
//        .onReceive(authVM.taskSuccess) {
//            isActive = true
//            userData.name = nickname
//        }
    }
}

// MARK: - View Detail
extension RegNicknameView {
    private var nicknameField: some View {
        StdTextField(text: $nickname, maxLength: 10, placeholder: "닉네임을 입력하세요")
                    .focused($isTextFieldFocused)
                    .onChange(of: nickname) { newValue in
                        validateNickname(nickname: newValue)
                    }
    }
    
    private var nextButton: some View {
        Button(action: {
            if nickname != "" && isNicknameValid && errorMessage == nil {
                /// 여기에 닉네임 검증 API 달아야해요!
//                authVM.nickNameValidate(nickname: nickname)
            }
        }) {
            Text("다 음")
                .font(.headline).bold()
                .padding()
                .frame(maxWidth: .infinity, minHeight: 50)
                .foregroundColor(.white)
                .background((nickname != "" && isNicknameValid && errorMessage == nil) ? Color.main100 : Color.grayScale200)
                .cornerRadius(10)
        }
        .padding(.bottom, 42)
        .disabled(!(nickname != "" && isNicknameValid && errorMessage == nil))
        .background(
//            CustomNavLink(destination: RegBirthdayView(userData: $userData), isActive: $isActive) {
//                EmptyView()
//            }
        )
    }
}

// MARK: - Function
extension RegNicknameView {
    private func validateNickname(nickname: String) {
        let regex = "^[가-힣A-Za-z0-9]+$"

        if nickname.isEmpty {
            self.errorMessage = NicknameError.empty.localizedDescription
            self.isNicknameValid = false
        } else if NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: nickname) {
            self.errorMessage = nil
            self.isNicknameValid = true
        } else {
            self.errorMessage = NicknameError.invalidCharacters.localizedDescription
            self.isNicknameValid = false
        }
    }
}

// MARK: - Preview
struct RegNicknameView_Previews: PreviewProvider {
    static var previews: some View {
        RegNicknameView(provider: "testProvider", token: "testToken")
    }
}
