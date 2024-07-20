//
//  AddressViewModel.swift
//  Aehopark
//
//  Created by 문창재 on 7/21/24.
//

import Foundation
import SwiftUI
import Combine
import WebKit

class AddressViewModel: ObservableObject {
    @Published var address: String = ""
    @Published var showWebView: Bool = false
    @Published var addresses: [Address] = []

    func handleAddressSelection(data: [String: Any]) {
        if let roadAddress = data["roadAddress"] as? String,
           let jibunAddress = data["jibunAddress"] as? String,
           let zonecode = data["zonecode"] as? String {
            let address = Address(roadAddress: roadAddress, jibunAddress: jibunAddress, zonecode: zonecode)
            self.addresses.append(address)
            self.address = "\(roadAddress)"
            self.showWebView = false
        }
    }
}
