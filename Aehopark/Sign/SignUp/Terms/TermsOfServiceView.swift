import SwiftUI

struct TermsOfServiceView: View {
    
    @StateObject private var viewModel = TermsViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Text("애호박 서비스 이용 약관에 동의해주세요.")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }.padding()
                
                AllAgree
                    .padding()
                    .onChange(of: viewModel.agreeAll) { _ in
                        viewModel.updateAllAgree()
                    }
                
                Divider()
                    .padding(.bottom)
                
                VStack(spacing: 15){
                    serviceAgree
                        .padding(.horizontal)
                    privacyAgree
                        .padding(.horizontal)
                    marketingAgree
                        .padding(.horizontal)
                }
                
                
                Spacer()
                
                nextButton
                    .padding()
            }
            .navigationTitle("회원가입")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Button{
                        presentationMode.wrappedValue.dismiss()
                    }label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                    }
                }
            }
            
        }.environmentObject(viewModel)
        
    }
    
    var nextButton: some View{
        NavigationLink {
            FinishView()
        } label: {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: UIScreen.main.bounds.width * 0.8 , height: UIScreen.main.bounds.height * 0.07)
                .foregroundStyle(viewModel.isNextButtonDisabled ? Color.gray : ._377_D_00)
                .overlay {
                    Text("완 료")
                        .foregroundStyle(Color.white)
                }
        }.disabled(viewModel.isNextButtonDisabled)
    }
    
    var serviceAgree: some View{
        HStack{
            Toggle(isOn: $viewModel.agreeServiceTerms, label: {})
                .toggleStyle(CustomToggleStyle())
            Text("(필수) 서비스 이용약관 동의")
            Text("*")
                .foregroundStyle(Color.red)
            Spacer()
            Button(action: {
                viewModel.showServiceTermsSheet = true
            }) {
                Text("(보기)")
                    .font(.body)
                    .foregroundColor(.gray)
            }
            .sheet(isPresented: $viewModel.showServiceTermsSheet) {
                TermsDetailView(title: "서비스 이용약관", url: viewModel.terms[0].url)
            }
        }
    }
    
    var privacyAgree: some View{
        HStack{
            Toggle(isOn: $viewModel.agreePrivacyPolicy, label: {})
                .toggleStyle(CustomToggleStyle())
            Text("(필수) 개인정보 처리방침 동의")
            Text("*")
                .foregroundStyle(Color.red)
            Spacer()
            Button(action: {
                viewModel.showPrivacyPolicySheet = true
            }) {
                Text("(보기)")
                    .font(.body)
                    .foregroundColor(.gray)
            }
            .sheet(isPresented: $viewModel.showPrivacyPolicySheet) {
                TermsDetailView(title: "개인 정보 처리 방침", url: viewModel.terms[1].url)
            }
        }
    }
    
    var marketingAgree: some View{
        HStack{
            Toggle(isOn: $viewModel.agreeMarketingAlert, label: {})
                .toggleStyle(CustomToggleStyle())
            Text("(선택) 마케팅 수신동의")
            Spacer()
            Button(action: {
                viewModel.showMarketingAlertSheet = true
            }) {
                Text("(보기)")
                    .font(.body)
                    .foregroundColor(.gray)
            }
            .sheet(isPresented: $viewModel.showMarketingAlertSheet) {
                TermsDetailView(title: "마케팅 수신동의 방침", url: viewModel.terms[2].url)
            }
        }
    }
    
    var AllAgree: some View{
        VStack{
            HStack{
                Toggle(isOn: $viewModel.agreeAll, label: {})
                    .toggleStyle(AllAgreeToggleStyle())
                Text("전체 약관동의")
                    .font(.title2)
                Spacer()
            }
            HStack{
                Image(systemName: "checkmark.circle.fill")
                    .opacity(0)
                Text("서비스 이용을 위해 아래 약관들을 모두 동의합니다.")
                    .font(.caption)
                    .foregroundStyle(Color.gray)
                Spacer()
            }
        }
    }
}


struct TermsDetailView: View {
    let title: String
    let url: URL
    
    var body: some View {
        NavigationStack {
            VStack {
                TermsWebView(url: url)
                }
                .navigationTitle(title)
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }




#Preview {
    TermsOfServiceView()
}
