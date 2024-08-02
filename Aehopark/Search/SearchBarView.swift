//
//  SearchBarView.swift
//  Aehopark
//
//  Created by wodnd on 7/15/24.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchTerm: String
    
    let placeHolder: String
    let disabled: Bool
    
    init(
        placeHolder: String = "재료를 검색해보세요",
        searchTerm: Binding<String>,
        disabled: Bool = false
    ) {
        self.placeHolder = placeHolder
        self._searchTerm = searchTerm
        self.disabled = disabled
    }
    
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
                .renderingMode(.template)
                .foregroundColor(._377_D_00.opacity(0.6))
            TextField(text: $searchTerm) {
                Text(placeHolder)
                    .font(.Inter(.regular, size: 16))
                    .foregroundColor(._767676)
            }
            .submitLabel(.search)
            .disabled(disabled)
            .onSubmit {
                Task {
                    if searchTerm != "" {
                      
                    }
                }
            }
            Image(systemName: "mic.fill")
                .renderingMode(.template)
                .foregroundColor(._377_D_00.opacity(0.6))
        }
        .padding(8)
        .background(
            Rectangle()
                .foregroundColor(.DBDBDB.opacity(0.5))
                .cornerRadius(10)
        )
        .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24))
    }
}

#Preview {
    SearchBarView(searchTerm: .constant(""))
}
