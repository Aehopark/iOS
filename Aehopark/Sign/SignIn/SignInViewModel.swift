//
//  SignInViewModel.swift
//  Aehopark
//
//  Created by 문창재 on 7/24/24.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser
import AuthenticationServices

struct KakaoLoginModule {
    @Binding var isLoggedIn: Bool
    @State private var accessToken: String?
    @State private var refreshToken: String?
    
    func login() {
        if UserApi.isKakaoTalkLoginAvailable() {
            UserApi.shared.loginWithKakaoTalk { (oauthToken, error) in
                if let error = error {
                    print(error)
                } else if let oauthToken = oauthToken {
                    print("KakaoTalk login success: \(oauthToken)")
                    isLoggedIn = true
                    //토큰 관리
                    accessToken = oauthToken.accessToken
                    refreshToken = oauthToken.refreshToken
                    //UserDefaults 저장
                    saveTokens()
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
    
    func saveTokens() {
            UserDefaults.standard.set(accessToken, forKey: "accessToken")
            UserDefaults.standard.set(refreshToken, forKey: "refreshToken")
        }
    
    func checkToken() {
            if let savedAccessToken = UserDefaults.standard.string(forKey: "accessToken"),
               let savedRefreshToken = UserDefaults.standard.string(forKey: "refreshToken") {
                self.accessToken = savedAccessToken
                self.refreshToken = savedRefreshToken
                isLoggedIn = true
            }
        }
    
    func logout() {
            UserApi.shared.logout { (error) in
                if let error = error {
                    print(error)
                } else {
                    print("logout() success.")
                    isLoggedIn = false
                    self.accessToken = nil
                    self.refreshToken = nil
                    //토큰 제거
                    UserDefaults.standard.removeObject(forKey: "accessToken")
                    UserDefaults.standard.removeObject(forKey: "refreshToken")
                }
            }
        }
    
}
