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
    
    struct State {
        var NicknameResponse: Bool = true
    }
    
    enum Action {
        case checkNickname(nickname: String)
    }
        
    @Published var state: State
    
    init(
        state: State = .init()
    ) {
        self.state = state
    }
    
    func action(_ action: Action) async {
            switch action {
            case let .checkNickname(nickname):
                // TODO - 제주맛집 API 호출
                if let response = await NicknameService.checkNicknameItem(nickname: nickname),
                   let responseData = response.result {
                    await MainActor.run {
                        print(response)
                        state.NicknameResponse = responseData
                    }
                } else {
                    print("Error")
                }
            }
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

