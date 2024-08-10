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
    @Binding var isSelected: Bool
    var body: some View {
        ZStack{
            if isSelected {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 1)
                    .frame(width: 110, height: 100)
                    .foregroundColor(._377_D_00)
                    .overlay{
                        VStack{
                            Image("\(imageName)")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 32, height: 32)
                            
                            Text("\(categoryName)")
                                .font(.Roboto(.regular, size: 12))
                                .foregroundColor(._377_D_00)
                                .padding(.top, 10)
                            
                        }
                    }
            } else {
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
}

#Preview {
    CategoryView(imageName: "야채류", categoryName: "야채류", isSelected: .constant(true))
}
