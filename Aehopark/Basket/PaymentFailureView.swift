//
//  PaymentFailureView.swift
//  Aehopark
//
//  Created by Suin Kim on 7/23/24.
//

import SwiftUI

struct PaymentFailureView: View {
    var body: some View {
        VStack {
            Text("결제가 실패하였습니다.")
                .font(.title)
                .padding()
        }
        .navigationTitle("결제 실패")
        .navigationBarTitleDisplayMode(.inline)
    }
}
