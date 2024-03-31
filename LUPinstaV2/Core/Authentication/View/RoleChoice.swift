//
//  RoleChoice.swift
//  LUPinstaV2
//
//  Created by Joaquim Menezes on 25/03/24.
//

import SwiftUI

struct RoleChoice: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    
    var body: some View {
        VStack(spacing:12){
            
            Text("Choose your Role")
                .font(.title2)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding(.top,24)
            
            Text("Choose between being a Coach or a Trainee")
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .padding(.bottom,24)
            
            //choice option
            
            
            
            VStack {
                Button(action: {
                    viewModel.role = "Coach"
                }) {
                    HStack {
                        Image(systemName: "figure.and.child.holdinghands")
                            .resizable()
                            .frame(width: 50, height: 50)
                        Text("Coach")
                            .padding()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundColor(viewModel.role == "Coach" ? .white : .blue)
                    .background(viewModel.role == "Coach" ? Color.green : Color.clear)
                    .cornerRadius(5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.blue, lineWidth: 1)
                    )
                }
                
                Button(action: {
                    viewModel.role = "Trainee"
                }) {
                    HStack {
                        Image(systemName: "figure.run")
                            .resizable()
                            .frame(width: 50, height: 50)
                        Text("Trainee")
                            .padding()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundColor(viewModel.role == "Trainee" ? .white : .blue)
                    .background(viewModel.role == "Trainee" ? Color.green : Color.clear)
                    .cornerRadius(5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.blue, lineWidth: 1)
                    )
                }
            }
            .padding()
            
            
            
            
            
            
//            SecureField("Enter your password", text: $viewModel.role)
//                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
//                .modifier(LUPTextFieldModifier())
            
            NavigationLink{
                CompleteSignUpView()
                    .navigationBarBackButtonHidden(true)
            } label:{
                Text("Next")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 44)
                    .background(viewModel.shouldRoleButtonBeEnabled ? .green : .gray)
                    .cornerRadius(10)
                    
            }
            .padding(.horizontal)
            .disabled(!viewModel.shouldRoleButtonBeEnabled)
            
            
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
    RoleChoice()
}
