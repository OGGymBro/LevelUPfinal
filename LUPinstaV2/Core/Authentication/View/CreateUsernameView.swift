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
            
            Text("Pick a username for your account.")
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .padding(.bottom,24)
            
            TextField("Enter your username", text: $viewModel.username)
                .autocapitalization(.none)
                .modifier(LUPTextFieldModifier())
                .onChange(of: viewModel.username) { _ in
                    viewModel.checkUsernameAvailability()
                }
//                .background(
//                    RoundedRectangle(cornerRadius: 8)
//                        .foregroundColor(viewModel.isUsernameAvailable ? Color.clear : Color.red.opacity(0.3))
//                        .animation(.easeInOut(duration: 0.3))
//                )
//                .padding()

            
            
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
                    .background(viewModel.shouldUsernameButtonBeEnabled ||  !viewModel.isUsernameAvailable ? .green : .gray)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            .disabled(!viewModel.shouldUsernameButtonBeEnabled || !viewModel.isUsernameAvailable)
            
            if !viewModel.isUsernameAvailable {
                HStack{
                    Image(systemName: "exclamationmark.triangle.fill")
                        .foregroundStyle(.red)
                        .font(.title)
                    Text("Username is already taken. \nPlease choose another one.")
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        
                }
                
            }


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
