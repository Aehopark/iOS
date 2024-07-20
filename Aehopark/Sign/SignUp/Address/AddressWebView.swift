//
//  AddressWebView.swift
//  Aehopark
//
//  Created by 문창재 on 7/21/24.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL
    @ObservedObject var viewModel: AddressViewModel

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView(frame: .zero, configuration: createConfiguration())
        webView.navigationDelegate = context.coordinator
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    private func createConfiguration() -> WKWebViewConfiguration {
        let configuration = WKWebViewConfiguration()
        let contentController = WKUserContentController()
        contentController.add(makeCoordinator(), name: "callBackHandler")
        configuration.userContentController = contentController
        return configuration
    }

    class Coordinator: NSObject, WKScriptMessageHandler, WKNavigationDelegate {
        var parent: WebView

        init(_ parent: WebView) {
            self.parent = parent
        }

        func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
            if message.name == "callBackHandler", let data = message.body as? [String: Any] {
                DispatchQueue.main.async {
                    self.parent.viewModel.handleAddressSelection(data: data)
                }
            }
        }
    }
}
