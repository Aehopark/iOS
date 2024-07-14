//
//  ErrorMessageText.swift
//  Aehopark
//
//  Created by 준호 on 7/15/24.
//

import SwiftUI

struct ErrorMessageText: View {
    let errorMessage: String?
    
    init(errorMessage: String?) {
        self.errorMessage = errorMessage
    }
    
    var body: some View {
        HStack {
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .font(Font.custom("Pretendard", size: 14).weight(.regular))
                    .foregroundColor(Color(red: 0.99, green: 0.27, blue: 0.27))
                    .padding(.top, 4)
            }
            Spacer()
        }
    }
}
