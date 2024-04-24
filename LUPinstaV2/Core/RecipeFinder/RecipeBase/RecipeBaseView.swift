//
//  RecipeBaseView.swift
//  LUPinstaV2
//
//  Created by Joaquim Menezes on 24/04/24.
//

import SwiftUI
import Kingfisher

struct Carousel: View {
    var imageLink: String
    var recipeTitle: String
    
    var body: some View {
        ZStack {
            // Background image
            if let url = URL(string: imageLink) {
                // Asynchronously load the image from the URL using KFImage
                KFImage(url)
                    .placeholder {
                        // Show a placeholder while loading
                        ZStack {
                            Color.gray
                            ProgressView() // ProgressView for loading progress
                        }
                    }
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 350, height: 150)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.blue, lineWidth: 2)
                    )
            } else {
                Color.blue // Fallback background color if image loading fails
            }
            
            // Recipe title
            Text(recipeTitle)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.top, 85)
                .padding(.trailing, 175)
        }
        .padding(.horizontal)
    }
}

struct RecipeBaseView: View {
    @StateObject var viewModel = RecipeBaseViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical ,showsIndicators: false) {
                NavigationLink(destination: RecipeSearchView()) {
                    Text("Search Recipes")
                }
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(10)
                .shadow(color: .gray, radius: 3, x: 0, y: 3)
                .padding()
                
                VStack(alignment: .leading) {
                    // Non-Vegetarian Section
                    Text("Non-Vegetarian 🍗") // Section heading
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 10)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.red]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(8)

                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(viewModel.recipes.filter { !$0.isVeg }) { recipe in
                                NavigationLink(destination: RecipeDetailsView(takenRecipe: recipe)) {
                                    Carousel(imageLink: recipe.imageLink, recipeTitle: recipe.recipeName)
                                }
                            }
                        }
                        .padding(.horizontal,0)
                        
                    }
                    Divider()
                }
                .padding(.leading,10)
                .padding(.trailing,10)
                
                VStack(alignment: .leading) {
                    // Vegetarian Section
                    Text("Vegetarian 🌱") // Section heading
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 10)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.green, Color.yellow]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(8)

                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(viewModel.recipes.filter { $0.isVeg }) { recipe in
                                NavigationLink(destination: RecipeDetailsView(takenRecipe: recipe)) {
                                    Carousel(imageLink: recipe.imageLink, recipeTitle: recipe.recipeName)
                                }
                            }
                        }
                        .padding(.horizontal,0)
                    }
                    Divider()
                }
                .padding(.leading,10)
                .padding(.trailing,10)
                
                // Display safe tags of the current user
                VStack() {
                    Text("Your Safe Tags:")
                        .fontWeight(.bold)
                        //.foregroundStyle()
                    ForEach(viewModel.currentUserSafeTags, id: \.self) { tag in
                        Text("\(tag)-safe")
                            .foregroundColor(.white)
                            .padding(.vertical, 5)
                            .padding(.horizontal, 10)
                            .background(LinearGradient(gradient: Gradient(colors: [Color.green.opacity(0.8), Color.green.opacity(0.4)]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(8)
                    }

                }
                
               
                
                Spacer()
            }
            .navigationTitle("Recipes For You!")
        }
    }
}


