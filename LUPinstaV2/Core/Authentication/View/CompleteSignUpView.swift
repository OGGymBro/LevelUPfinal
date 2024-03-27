//
//  CompleteSignUpView.swift
//  LUPinstaV2
//
//  Created by Joaquim Menezes on 25/03/24.
//

import SwiftUI

struct CompleteSignUpView: View {
    @State private var isLoading = false
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    
    var body: some View {
        ZStack{
            VStack(spacing:12){
                
                Spacer()
                
                Text("Welcome to LevelUP, \(viewModel.username)")
                    .font(.title2)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.top,24)
                    .multilineTextAlignment(.center)
                
                Text("Click below to complete registration and start using LevelUP")
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.bottom,24)
                
                Button {
                    Task {
                        isLoading.toggle()
                        try await viewModel.createUser()
                        isLoading.toggle()
                    }
                } label:{
                    Text("Complete Sign Up")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 345,height: 44)
                        .background(Color(.systemGreen))
                        .cornerRadius(10)
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
            
            if isLoading {
                Color.black.opacity(0.5)
                    .edgesIgnoringSafeArea(.all)
                
                LottieLoader(fileName: "gym11") // or any other loading indicator
            }
            
            
        }
    }
}

#Preview {
    CompleteSignUpView()
}
