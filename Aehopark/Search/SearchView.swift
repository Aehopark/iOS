//
//  SearchView.swift
//  Aehopark
//
//  Created by wodnd on 7/15/24.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        VStack{
            NavigationBar(title: "")
                .padding(.top, 22)
            
            Spacer()
        }
        .toolbar(.hidden)
    }
}

#Preview {
    SearchView()
}
