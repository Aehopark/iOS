//
//  OrderView.swift
//  Aehopark
//
//  Created by Suin Kim on 7/21/24.
//

import SwiftUI

struct OrderView: View {
    var body: some View {
        VStack {
            Text("결제 수단 관리")
                .font(.Roboto(.semibold, size: 16))
                .padding()
            
            Divider()
            
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("주문 / 결제")
                    .font(.Roboto(.semibold, size: 20))
            }
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
