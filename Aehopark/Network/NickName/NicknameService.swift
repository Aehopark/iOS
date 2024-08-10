//
//  NicknameService.swift
//  Aehopark
//
//  Created by wodnd on 8/11/24.
//

import Foundation
struct NicknameService {
    static func checkNicknameItem(nickname: String) async -> BaseResponse<Bool>? {
        return await NetworkManager.shared.request(NicknameEndPoint.checkNicknameItem(nickname: nickname))
    }
}
