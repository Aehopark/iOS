//
//  AehoparkApp.swift
//  Aehopark
//
//  Created by wodnd on 7/14/24.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth

@main
struct AehoparkApp: App {
    
    init() {
            // Kakao SDK 초기화
        //App Key는 info.plist에 있습니다
        let kakaoAppKey = Bundle.main.infoDictionary?["KAKAO_NATIVE_APP_KEY"] ?? ""
        
        KakaoSDK.initSDK(appKey: kakaoAppKey as! String)
        }
    
    var body: some Scene {
        WindowGroup {
            //AehoparkTabView()
            SignInView()
        }
    }
}
