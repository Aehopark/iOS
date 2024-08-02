//
//  CategoryView.swift
//  Aehopark
//
//  Created by wodnd on 7/20/24.
//

import SwiftUI

struct CategoryView: View {
    var imageName: String
    var categoryName: String
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 1)
                .frame(width: 110, height: 100)
                .foregroundColor(.DBDBDB)
                .overlay{
                    VStack{
                        Image("\(imageName)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 32, height: 32)
                        
                        Text("\(categoryName)")
                            .font(.Roboto(.regular, size: 12))
                            .foregroundColor(.black)
                            .padding(.top, 10)
                        
                    }
                }
        }
    }
}

#Preview {
    CategoryView(imageName: "야채류", categoryName: "야채류")
}
