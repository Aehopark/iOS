//
//  TermsModel.swift
//  Aehopark
//
//  Created by 문창재 on 7/22/24.
//

import Foundation

struct Term: Identifiable {
    let id = UUID()
    let title: String // sheet 타이틀
    let isRequired: Bool // 필수 동의 항목
    let url: URL // webView 노션 url
}
