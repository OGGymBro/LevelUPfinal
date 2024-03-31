//
//  CreatePasswordView.swift
//  LUPinstaV2
//
//  Created by Joaquim Menezes on 25/03/24.
//

import SwiftUI

struct CreatePasswordView: View {
   // @State private var password = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    
    var body: some View {
        VStack(spacing:12){
            
            Text("Create a password")
                .font(.title2)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding(.top,24)
            
            Text("Your password must be")
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .padding(.bottom,24)
            
            //8 char
            Text("atleast 8 characters in length")
                .foregroundStyle(viewModel.passwordHasGoodLength ? .green: .gray)
                .fontWeight(.bold)
            
            
            Text("and should include")
                .foregroundStyle(.green)
            
            Text("numbers")
                .foregroundStyle(viewModel.passwordHasNumbers ? .green : .gray)
                .fontWeight(.bold)
            
            Text("special characters")
                .foregroundStyle(viewModel.passwordHasSpecialCharacters ? .green : .gray)
                .fontWeight(.bold)
            
            Text("uppercase")
                .foregroundStyle(viewModel.passwordHasUppercase ? .green : .gray)
                .fontWeight(.bold)
            
            + Text(" and")
                .foregroundStyle(.green)
            
            Text("lowercase")
                .foregroundStyle(viewModel.passwordHasLowercase ? .green : .gray)
                .fontWeight(.bold)
            
            + Text(" letters")
                .foregroundStyle(.green)
                
            
            SecureField("Enter your password", text: $viewModel.password)
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .modifier(LUPTextFieldModifier())
                .padding(.top,24)
            
            NavigationLink{
                RoleChoice()
                    .navigationBarBackButtonHidden(true)
            } label:{
                Text("Next")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 44)
                    .background(viewModel.shouldPasswordButtonBeEnabled ? .green : .gray)
                    .cornerRadius(10)
                    .disabled(!viewModel.shouldPasswordButtonBeEnabled)
            }
            .padding(.horizontal)
            
            
            Spacer()
            
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
    }
}

#Preview {
    CreatePasswordView()
}
