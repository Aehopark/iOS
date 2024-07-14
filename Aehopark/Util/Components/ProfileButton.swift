//
//  ProfileButton.swift
//  Aehopark
//
//  Created by 준호 on 7/15/24.
//

import SwiftUI

import SwiftUI

struct ProfileButton: View {
    var uiImage: UIImage?
    var image: Image?
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            HStack(alignment: .center, spacing: 0) {
                if let uiImage = uiImage {
                    Image(uiImage: uiImage)
                        .resizable()
                        .frame(width: 90, height: 90)
                        .zIndex(1)
                } else if let image = image {
                    image
                        .resizable()
                        .frame(width: 90, height: 90)
                        .zIndex(1)
                }
            }
            .frame(width: 90, alignment: .center)
            .background(Color(red: 0.86, green: 0.96, blue: 0.78))
            .cornerRadius(100)
//            .overlay(
//                RoundedRectangle(cornerRadius: 100)
//                .inset(by: 0.5)
//                .stroke(Color.main100, lineWidth: 1)
//            )
            
            HStack(alignment: .center, spacing: 0) {
                Image(systemName: "pencil")
                    .fontWeight(.bold)
                    .frame(width: 18, height: 18)
                    .foregroundColor(.white)
            }
            .padding(7)
            .frame(width: 32, height: 32, alignment: .center)
            .background(Color.main100)
            .clipped()
            .clipShape(Circle())
            .overlay(
                RoundedRectangle(cornerRadius: 36)
                    .inset(by: 1)
                    .stroke(.white, lineWidth: 2)
            )
        }
    }
}
