//
//  AddressModel.swift
//  Aehopark
//
//  Created by 문창재 on 7/21/24.
//

import Foundation

struct Address: Identifiable {
    let id = UUID()
    let roadAddress: String
    let jibunAddress: String
    let zonecode: String
    var detailAddress: String
}
