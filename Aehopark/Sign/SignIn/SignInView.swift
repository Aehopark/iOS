//
//  SignInView.swift
//  Aehopark
//
//  Created by 문창재 on 7/16/24.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser
import AuthenticationServices


struct SignInView: View {
    @State private var isLoggedIn: Bool = false
    
    var body: some View {
        NavigationStack{
            VStack {
                Spacer()
                
                mainLogo
                
                Spacer()
                
                // 로그인 성공시 닉네임 적는 뷰로 이동
                NavigationLink(destination: NicknameView(), isActive: $isLoggedIn) {
                                    EmptyView()
                                }
                
                kakaoLogin.padding(.horizontal)
                
//                appleLogin.padding(.horizontal)
                
                AppleSigninButton(isLoggedIn: $isLoggedIn)
                
                unknownLogin.padding()
                
                Spacer()
            }
            .padding()
        }
        
    }
    
    var mainLogo: some View{
        VStack{
            Text("모든 재료의 가격 비교")
                .foregroundStyle(Color("Aehopark"))
            Image("AehoparkLogo")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width * 0.5)
        }
    }
    
    var kakaoLogin: some View{
        Button{
            //카카오 로그인
            KakaoLoginModule(isLoggedIn: $isLoggedIn).login()
        }label: {
            Image("kakaoLogin")
                .resizable()
                .scaledToFit()
        }
    }
    
    var appleLogin: some View{
        Button{
            //애플 로그인
        }label: {
            Image("appleLogin")
                .resizable()
                .scaledToFit()
        }
    }
    
    var unknownLogin: some View{
        Button{
            //메인 화면 가기
        } label: {
            Text("로그인하지 않고 둘러보기")
                .tint(.gray)
                .underline()
        }
    }
    
}


struct AppleSigninButton : View{
    @Binding var isLoggedIn:Bool
    
    var body: some View{
        SignInWithAppleButton(
            onRequest: { request in
                request.requestedScopes = [.fullName, .email]
            },
            onCompletion: { result in
                switch result {
                case .success(let authResults):
                    print("Apple Login Successful")
                    switch authResults.credential{
                        case let appleIDCredential as ASAuthorizationAppleIDCredential:
                           // 계정 정보 가져오기
                            let UserIdentifier = appleIDCredential.user
                            let fullName = appleIDCredential.fullName
                            let name =  (fullName?.familyName ?? "") + (fullName?.givenName ?? "")
                            let email = appleIDCredential.email
                            let IdentityToken = String(data: appleIDCredential.identityToken!, encoding: .utf8)
                            let AuthorizationCode = String(data: appleIDCredential.authorizationCode!, encoding: .utf8)
                        isLoggedIn = true
                    default:
                        break
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    print("error")
                }
            }
        )
        .frame(width : UIScreen.main.bounds.width * 0.85, height:50)
        .cornerRadius(5)
    }
}

#Preview {
    SignInView()
}
