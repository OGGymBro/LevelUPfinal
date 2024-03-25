//
//  SearchView.swift
//  LUPinstaV2
//
//  Created by Joaquim Menezes on 25/03/24.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @StateObject var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVStack(spacing: 12){
                    ForEach(viewModel.users) { user in
                        
                        NavigationLink(value: user) {
                            //
                            HStack {
                                Image(systemName: "person.circle")
                                    .resizable()
                                    .scaledToFill()
                                    .foregroundStyle(.gray)
                                    .frame(width: 40,height: 40)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                
                                VStack(alignment: .leading){
                                    Text(user.username)
                                    
                                    if user.fullname != nil {
                                        Text(user.fullname ?? "")
                                    }
                                    
                                }
                                
                                Spacer()
                            }
                            .accentColor(.green)
                            .padding(.horizontal)
                            //
                        }
                        
                    }
                }
                .padding(.top,8)
                .searchable(text: $searchText,prompt: "Search for Mentors")
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
