//
//  RecipeSearchView.swift
//  TrialRoom
//
//  Created by Joaquim Menezes on 21/04/24.
//

import SwiftUI
import Kingfisher

struct RecipeSearchView: View {
    @StateObject var viewModel = RecipeSearchViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
                ForEach(viewModel.recipes.filter { viewModel.searchTerm.isEmpty || $0.recipeName.localizedCaseInsensitiveContains(viewModel.searchTerm) }) { recipe in
                    NavigationLink(destination: RecipeDetailsView(takenRecipe: recipe)) {
                        RecipeListItem(recipe: recipe)
                    }
                }
            }
            .padding()
        }
        .searchable(text: $viewModel.searchTerm, prompt: "Search for Recipes")
    }
}


// Recipe list item view
struct RecipeListItem: View {
    var recipe: Recipe
    
    var body: some View {
        VStack(alignment: .leading) {
            // Recipe image
            ZStack {
                KFImage(URL(string: recipe.imageLink))
                //            RemoteImage(url: recipe.imageLink)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .cornerRadius(10)
                    .padding(.bottom, 5)
                
                // Translucent material behind recipe name
                Rectangle()
                    .frame(height: 75)
                    .foregroundColor(Color.black.opacity(0.4)) // Adjust opacity as needed
                    .cornerRadius(10)
                    .overlay(
                        // Recipe name
                        Text(recipe.recipeName)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 20)
                    )
                
            }
            
            
            
            
            
            // Add more recipe details as needed
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
        
        Divider()
    }
}



#Preview {
    RecipeSearchView()
}
