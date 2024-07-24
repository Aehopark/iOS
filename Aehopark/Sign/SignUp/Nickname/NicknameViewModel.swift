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
        return (nicknameModel.nickname.isEmpty || nicknameModel.nickname.containsSpecialCharacter())
    }
}

extension String {
    // 특수문자가 포함되어 있는지 확인하는 함수
    func containsSpecialCharacter() -> Bool {
        //특수문자 세트
        let specialCharacterSet = CharacterSet.alphanumerics.inverted
        
        return self.rangeOfCharacter(from: specialCharacterSet) != nil
    }
}
