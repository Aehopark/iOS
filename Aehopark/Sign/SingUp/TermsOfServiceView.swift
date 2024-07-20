import SwiftUI

struct TermsOfServiceView: View {
    @State private var agreeAll: Bool = false
    
    @State private var agreeServiceTerms: Bool = false
    @State private var agreePrivacyPolicy: Bool = false
    @State private var agreeMarketingAlert: Bool = false
    
    @State private var showServiceTermsSheet: Bool = false
    @State private var showPrivacyPolicySheet: Bool = false
    @State private var showMarketingAlertSheet: Bool = false
    
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
                    .onChange(of: agreeAll) {
                        agreeServiceTerms = true
                        agreePrivacyPolicy = true
                        agreeMarketingAlert = true
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
            
        }
        
    }
    
    var isNextButtonDisabled: Bool {
        return !(agreeServiceTerms && agreePrivacyPolicy)
    }
    
    var nextButton: some View{
        NavigationLink {
            FinishView()
        } label: {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: UIScreen.main.bounds.width * 0.8 , height: UIScreen.main.bounds.height * 0.07)
                .foregroundStyle(isNextButtonDisabled ? Color.gray : ._377_D_00)
                .overlay {
                    Text("완 료")
                        .foregroundStyle(Color.white)
                }
        }.disabled(isNextButtonDisabled)
    }
    
    var serviceAgree: some View{
        HStack{
            Toggle(isOn: $agreeServiceTerms, label: {})
                .toggleStyle(CustomToggleStyle())
            Text("(필수) 서비스 이용약관 동의")
            Text("*")
                .foregroundStyle(Color.red)
            Spacer()
            Button(action: {
                showServiceTermsSheet = true
            }) {
                Text("(보기)")
                    .font(.body)
                    .foregroundColor(.gray)
            }
            .sheet(isPresented: $showServiceTermsSheet) {
                TermsDetailView(title: "서비스 이용약관", text: "ㅇㅇㅇㅇ")
            }
        }
    }
    
    var privacyAgree: some View{
        HStack{
            Toggle(isOn: $agreePrivacyPolicy, label: {})
                .toggleStyle(CustomToggleStyle())
            Text("(필수) 개인정보 처리방침 동의")
            Text("*")
                .foregroundStyle(Color.red)
            Spacer()
            Button(action: {
                showPrivacyPolicySheet = true
            }) {
                Text("(보기)")
                    .font(.body)
                    .foregroundColor(.gray)
            }
            .sheet(isPresented: $showPrivacyPolicySheet) {
                TermsDetailView(title: "개인 정보 처리 방침", text: "ㅇㅇㅇㅇ")
            }
        }
    }
    
    var marketingAgree: some View{
        HStack{
            Toggle(isOn: $agreeMarketingAlert, label: {})
                .toggleStyle(CustomToggleStyle())
            Text("(선택) 마케팅 수신동의")
            Spacer()
            Button(action: {
                showMarketingAlertSheet = true
            }) {
                Text("(보기)")
                    .font(.body)
                    .foregroundColor(.gray)
            }
            .sheet(isPresented: $showMarketingAlertSheet) {
                TermsDetailView(title: "마케팅 수신동의 방침", text: "ㅇㅇㅇㅇ")
            }
        }
    }
    
    var AllAgree: some View{
        VStack{
            HStack{
                Toggle(isOn: $agreeAll, label: {})
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
    let text: String
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    Text(text)
                        .padding()
                }
                .navigationTitle(title)
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct CustomToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }) {
            HStack {
                Image(systemName: "checkmark")
                    .foregroundColor(configuration.isOn ? ._377_D_00 : .gray)
                configuration.label
            }
        }
    }
}

struct AllAgreeToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }) {
            HStack {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(configuration.isOn ? ._377_D_00 : .gray)
                configuration.label
            }
        }
    }
}

#Preview {
    TermsOfServiceView()
}
