//
//  RegProfileView.swift
//  Aehopark
//
//  Created by 준호 on 7/15/24.
//

import SwiftUI

struct RegProfileView: View {
    @State var isActive = false
    @State var showingSheet = false
    @State private var showCamera = false
    @State private var image: UIImage?
    @State var showImagePicker = false
    
    let topPadding: CGFloat = 72
    let BottomPadding: CGFloat = 24
    let horizontalPadding: CGFloat = 24
    
    let mainText = "테스터 님의 프로필 이미지를\n등록해주세요."
    let subText  = "사용자들에게 보여질 수도 있어요!"
    
    var body: some View {
        VStack {
            RegExplnTitle(mainText: mainText, subText: subText)
            profileSelect
                .padding(.top, 112)
            Spacer()
//            nextButton
        }
        .padding(.top, topPadding)
        .padding(.bottom, BottomPadding)
        .padding(.horizontal, horizontalPadding)
    }
}

extension RegProfileView {
    private var profileSelect: some View {
        ZStack {
            Button(action: {
                self.showingSheet = true
            }) {
                if let displayImage = image {
                    ProfileButton(uiImage: displayImage)
                } else {
                    ProfileButton(image: Image("profile-default"))
                }
            }
            .confirmationDialog("타이틀", isPresented: $showingSheet) {
                Button("사진 촬영", role: .none) {
                    showCamera = true
                }
                Button("앨범", role: .none) {
                    showImagePicker.toggle()
                }
                
                Button("취소", role: .cancel) {}
            }.sheet(isPresented: $showCamera) {
//                CameraView(selection: $image)
//                    .background(.black)
            }
            .sheet(isPresented: $showImagePicker) {
//                PhotoPicker(selection: $image)
            }
        }
    }
    
//    private var nextButton: some View {
//        CustomNavLink(destination: RegTermView(userData: $userData)
//                       ,isActive: $isActive
//        ) {
//            Button(action: {
//                /// image를 base64로 변환
////                userData.image = image
//                isActive = true
//            }) {
//                Text("다 음")
//                    .font(.headline).bold()
//                    .padding()
//                    .frame(maxWidth: .infinity, minHeight: 50)
//                    .foregroundColor(.white)
//                    .background(Color.main100)
//                    .cornerRadius(10)
//            }
//        }
//        .padding(.bottom, 42)
//    }
}

// MARK: - Preview
struct RegProfileView_Previews: PreviewProvider {
    static var previews: some View {
        RegProfileView()
    }
}
