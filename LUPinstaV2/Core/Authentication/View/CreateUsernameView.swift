//
//  CreateUsernameView.swift
//  LUPinstaV2
//
//  Created by Joaquim Menezes on 25/03/24.
//

import SwiftUI

struct CreateUsernameView: View {
    //@State private var username = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    
    var body: some View {
        VStack(spacing:12){
            
            Text("Create Username")
                .font(.title2)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding(.top,24)
            
            Text("Pick a username for your account.\n You can always change it later")
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .padding(.bottom,24)
            
            TextField("Enter your username", text: $viewModel.username)
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .modifier(LUPTextFieldModifier())
            
            NavigationLink{
                CreatePasswordView()
                    .navigationBarBackButtonHidden(true)
            } label:{
                Text("Next")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 44)
                    .background(viewModel.shouldUsernameButtonBeEnabled ? .green : .gray)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            .disabled(!viewModel.shouldUsernameButtonBeEnabled)

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
    CreateUsernameView()
}
