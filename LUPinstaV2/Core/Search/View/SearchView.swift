//
//  SearchView.swift
//  LUPinstaV2
//
//  Created by Joaquim Menezes on 25/03/24.
//

import SwiftUI

struct SearchView: View {
    //@State private var searchText = ""
    @StateObject var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVStack(spacing: 12){
                    ForEach(viewModel.filteredUsers) { user in
                        
                        NavigationLink(value: user) {
                            //
                            HStack {
                                CircularProfileImageView(user: user, size: .small)
                                
                                VStack(alignment: .leading){
                                    Text(user.username)
                                        .foregroundStyle(.green)
                                    
                                    if user.fullname != nil {
                                        Text(user.fullname ?? "")
                                    }else {
                                        Text("")
                                            .padding(.vertical,0.25)
                                    }
                                    Divider()
                                }
                                
                                Spacer()
                            }
                            .accentColor(.gray)
                            .padding(.horizontal)
                            //
                        }
                        
                    }
                }
                .padding(.top,8)
                .searchable(text: $viewModel.searchTerm,
                            prompt: "Search for Mentors")
            }
            .refreshable {
                await viewModel.refreshUsers()
            }
            
            .navigationTitle("Find Mentors")
            .navigationDestination(for: User.self,
                                   destination: { user in
                ProfileView(user: user)
            })
            //.navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

#Preview {
    SearchView()
}
