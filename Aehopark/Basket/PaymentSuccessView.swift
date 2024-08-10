//
//  PaymentSuccessView.swift
//  Aehopark
//
//  Created by Suin Kim on 7/23/24.
//

import SwiftUI

struct PaymentSuccessView: View {
    var body: some View {
        VStack {
            Text("결제가 완료되었습니다!")
                .font(.title)
                .padding()
        }
        .navigationTitle("결제 완료")
        .navigationBarTitleDisplayMode(.inline)
    }
}
