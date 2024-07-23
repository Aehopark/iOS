//
//  NicknameViewModel.swift
//  Aehopark
//
//  Created by 문창재 on 7/24/24.
//

import SwiftUI

class NicknameViewModel: ObservableObject {
    @Published var nicknameModel = NicknameModel()
    
    var isNextButtonDisabled: Bool {
        return nicknameModel.nickname.isEmpty
    }
}
