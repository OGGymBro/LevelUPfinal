//
//  ContentView.swift
//  LUPinstaV2
//
//  Created by Joaquim Menezes on 25/03/24.
//

import SwiftUI
struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    @StateObject var registrationViewModel = RegistrationViewModel()
    
    var body: some View {
            Group {
                if viewModel.userSession == nil {
                    LoginView()
                        .environmentObject(registrationViewModel)
                } else if let currentUser = viewModel.currentUser {
                    // Check the role directly without using == for comparison
                    if currentUser.role == "Coach" {
                        CoachTabView(user: currentUser)
                        
                    } else if currentUser.role == "Trainee" {
                        TraineeTabView(user: currentUser)
                        
                    } else {
                        // Handle unexpected roles here
                        Text("Unknown role")
                    }
                }
            }
        }
}
#Preview {
    ContentView()
}

//Group {
//    if viewModel.userSession == nil {
//        // If user session is nil, show the LoginView
//        LoginView()
//            .environmentObject(registrationViewModel)
//    } else if let currentUser = viewModel.currentUser {
//        // If user is logged in, check their role
//        switch currentUser.role {
//        case "Trainee":
//            // If role is Trainee, navigate to MainTabView
//            MainTabView()
//        case "Coach":
//            // If role is Coach, navigate to CoachTabView
//            CoachTabView()
//        default:
//            // Handle unexpected roles here
//            Text("Unknown role")
//        }
//    }
//}




//if viewModel.userSession == nil {
//    LoginView()
//        .environmentObject(registrationViewModel)
//}else if let currentUser = viewModel.currentUser {
//    MainTabView(user: currentUser)
//}

