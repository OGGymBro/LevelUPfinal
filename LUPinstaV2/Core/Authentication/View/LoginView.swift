//
//  AuthenticationView.swift
//  LUPinstaV2
//
//  Created by Joaquim Menezes on 25/03/24.
//

import SwiftUI

struct LoginView: View {
//    @State private var email = ""
//    @State private var password = ""
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            
            Spacer()
            
            Image("Applogo")
                .resizable()
                .frame(width: 150,height: 150)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                
                .padding(.bottom,25)
                
            
            VStack{
                TextField("Enter your email", text: $viewModel.email)
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .modifier(LUPTextFieldModifier())
                
                SecureField("Enter your password", text: $viewModel.password)
                    .modifier(LUPTextFieldModifier())
            }
            
            Button{
            } label: {
                Text("Forgot Password ?")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .padding(.top)
                    .padding(.trailing,24)
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .trailing)
            
            Button{
                Task{
                    try await viewModel.signIn()
                }

            }label: {
                Text("Login")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 360,height: 44)
                    .background(Color(.systemGreen))
                    .cornerRadius(10)
            }
            .padding(.vertical)
            
            HStack{
                Rectangle()
                    .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                    
                Text("OR")
                    .font(.footnote)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    
                Rectangle()
                    .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                    
            }
            .foregroundStyle(.gray)
            
            
            HStack{
                Image("Applogo")
                    .resizable()
                    .frame(width: 20  ,height: 20)
                
                Text("Login with Google")
                    .font(.footnote)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    
            }
            .padding(.top,8)
            
            Spacer()
            
            Divider()
            
            
            NavigationLink{
                AddEmailView()
                    .navigationBarBackButtonHidden(true)
            } label: {
                HStack {
                    Text("Don't have an account ?")
                    
                    Text("Sign Up")
                        .fontWeight(.semibold)
                }
                
               
            }
            .font(.callout)
            .padding(.vertical)
            
            
        }
    }
}

#Preview {
    LoginView()
}
