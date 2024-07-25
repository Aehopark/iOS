import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel = ProfileViewModel()
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("애호박박 님의 프로필 이미지를 등록해주세요.")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }.padding()
                
                Spacer()
                
                ZStack(alignment: .bottomTrailing) {
                    if let profileImage = viewModel.profile.image {
                        Image(uiImage: profileImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 200)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                            .shadow(radius: 10)
                    } else {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .scaledToFill()
                            .foregroundStyle(Color("90A344"))
                            .frame(width: 200, height: 200)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                            .shadow(radius: 10)
                    }
                    
                    Button(action: {
                        viewModel.showImagePicker = true
                    }) {
                        Image(systemName: "pencil.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(Color(._377_D_00))
                            .frame(width: 40, height: 40)
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(radius: 10)
                    }
                    .sheet(isPresented: $viewModel.showImagePicker) {
                        ImagePicker(selectedImage: $viewModel.profile.image)
                    }
                }
                
                Spacer()
                
                skipButton
                    .padding()
            }
            .navigationTitle("회원가입")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
    
    var skipButton: some View {
        NavigationLink {
            AddressView()
        } label: {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.07)
                .foregroundStyle(._377_D_00)
                .overlay {
                    if viewModel.profile.image != nil {
                        Text("다 음")
                            .foregroundStyle(Color.white)
                    } else {
                        Text("건너뛰기")
                            .foregroundStyle(Color.white)
                    }
                }
        }
    }
}

#Preview {
    ProfileView()
}
