//
//  NavigationBark.swift
//  Aehopark
//
//  Created by wodnd on 7/15/24.
//

import SwiftUI

struct NavigationBar: View {
    var title: String
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack{
            HStack{
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .renderingMode(.template)
                        .foregroundColor(._00520_D)
                }
                .padding(.leading, 24)
                
                Spacer()
            }
            HStack{
                Text("\(title)")
                    .font(.RobotoMono(.regular, size: 20))
            }
        }
    }
}

#Preview {
    NavigationBar(title: "페이지 이름")
}
