//
//  TermsWebView.swift
//  Aehopark
//
//  Created by 문창재 on 7/22/24.
//

import SwiftUI
import WebKit

struct TermsWebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
