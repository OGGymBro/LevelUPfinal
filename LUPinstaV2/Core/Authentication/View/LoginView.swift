//
//  AuthenticationView.swift
//  LUPinstaV2
//
//  Created by Joaquim Menezes on 25/03/24.
//

import SwiftUI

struct LoginView: View {
    @State private var isLoading = false
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Spacer()
                    
                    Image("Applogo")
                        .resizable()
                        .frame(width: 150,height: 150)
                        .clipShape(Circle())
                        .padding(.bottom,25)
                    
                    VStack{
                        TextField("Enter your email", text: $viewModel.email)
                            .autocapitalization(.none)
                            .modifier(LUPTextFieldModifier())
                        
                        SecureField("Enter your password", text: $viewModel.password)
                            .modifier(LUPTextFieldModifier())
                    }
                    
//                    Button{
//                        // Forgot Password Action
//                    } label: {
//                        Text("Forgot Password ?")
//                            .font(.footnote)
//                            .fontWeight(.semibold)
//                            .padding(.top)
//                            .padding(.trailing,24)
//                    }
//                    .frame(maxWidth: .infinity, alignment: .trailing)
                    
                    Button {
                        Task {
                            isLoading.toggle()
                            do {
                                try await viewModel.signIn()
                            }catch {
                                print("ERROR \(error.localizedDescription)")
                            }
                            isLoading.toggle()
                        }
                    } label: {
                        Text("Login")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(width: 360, height: 44)
                            .background(viewModel.isLoginEnabled ? Color(.systemGreen) : Color.gray) // Green when enabled, gray when disabled
                            .cornerRadius(10)
                    }
                    .padding(.vertical)
                    .disabled(!viewModel.isLoginEnabled)
                    
//                    HStack {
//                        Rectangle()
//                            .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
//                        
//                        Text("OR")
//                            .font(.footnote)
//                            .fontWeight(.bold)
//                        
//                        Rectangle()
//                            .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
//                    }
//                    .foregroundStyle(.gray)
                    
//                    HStack {
//                        Image("Applogo")
//                            .resizable()
//                            .frame(width: 20, height: 20)
//                        
//                        Text("Login with Google")
//                            .font(.footnote)
//                            .fontWeight(.bold)
//                    }
//                    .padding(.top,8)
                    
                    Spacer()
                    
                    Divider()
                    
                    NavigationLink {
                        AddEmailView()
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        HStack {
                            Text("Don't have an account ?")
                            
                            Text("Sign Up")
                                .fontWeight(.semibold)
                        }
                        .foregroundStyle(.green)
                    }
                    .font(.callout)
                    .padding(.vertical)
                    
                    HStack{
                        Text("© 2024 LevelUP Fitness")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                }
                
                if isLoading {
                    Color.black.opacity(0.1)
                        .edgesIgnoringSafeArea(.all)
                    
                    LottieLoader(fileName: "gym11") // or any other loading indicator
                }
            }
        }
    }
}


#Preview {
    LoginView()
}
