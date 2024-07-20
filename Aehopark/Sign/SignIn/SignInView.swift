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

struct SignInView: View {
    @State private var isLoggedIn: Bool = false
    
    var body: some View {
        NavigationStack{
            VStack {
                Spacer()
                
                mainLogo
                
                Spacer()
                
                NavigationLink(destination: Text("SignUp"), isActive: $isLoggedIn) {
                                    EmptyView()
                                }
                
                kakaoLogin.padding(.horizontal)
                
                appleLogin.padding(.horizontal)
                
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


struct KakaoLoginModule {
    @Binding var isLoggedIn: Bool
    
    func login() {
        if UserApi.isKakaoTalkLoginAvailable() {
            UserApi.shared.loginWithKakaoTalk { (oauthToken, error) in
                if let error = error {
                    print(error)
                } else if let oauthToken = oauthToken {
                    print("KakaoTalk login success: \(oauthToken)")
                    isLoggedIn = true
                }
            }
        } else {
            UserApi.shared.loginWithKakaoAccount { (oauthToken, error) in
                if let error = error {
                    print(error)
                } else if let oauthToken = oauthToken {
                    print("KakaoAccount login success: \(oauthToken)")
                    isLoggedIn = true
                }
            }
        }
    }
}

#Preview {
    SignInView()
}
