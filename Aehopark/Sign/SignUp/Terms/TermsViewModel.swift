//
//  TermsViewModel.swift
//  Aehopark
//
//  Created by 문창재 on 7/22/24.
//

import SwiftUI

class TermsViewModel: ObservableObject {
    @Published var agreeAll: Bool = false
    @Published var agreeServiceTerms: Bool = false
    @Published var agreePrivacyPolicy: Bool = false
    @Published var agreeMarketingAlert: Bool = false
    
    @Published var showServiceTermsSheet: Bool = false
    @Published var showPrivacyPolicySheet: Bool = false
    @Published var showMarketingAlertSheet: Bool = false
    
    var terms: [Term] = [
        Term(title: "(필수) 서비스 이용약관 동의", isRequired: true, url: URL(string: "https://orange-pewter-bd6.notion.site/webView-4c5861e3c1de4be8abfa8cf1a75181f2?pvs=4")!),
        Term(title: "(필수) 개인정보 처리방침 동의", isRequired: true, url: URL(string: "https://orange-pewter-bd6.notion.site/webView-4c5861e3c1de4be8abfa8cf1a75181f2?pvs=4")!),
        Term(title: "(선택) 마케팅 수신동의", isRequired: false, url: URL(string: "https://orange-pewter-bd6.notion.site/webView-4c5861e3c1de4be8abfa8cf1a75181f2?pvs=4")!)
    ]
    // url 옵셔널 관리 필요
    
    func updateAllAgree() {
        if agreeAll {
            agreeServiceTerms = true
            agreePrivacyPolicy = true
            agreeMarketingAlert = true
        } else {
            agreeServiceTerms = false
            agreePrivacyPolicy = false
            agreeMarketingAlert = false
        }
    }
    
    var isNextButtonDisabled: Bool {
        return !(agreeServiceTerms && agreePrivacyPolicy)
    }
}
