//
//  RecipeDetailsView.swift
//  TrialRoom
//
//  Created by Joaquim Menezes on 21/04/24.
//

import SwiftUI
import YouTubePlayerKit

struct RecipeDetailsView: View {
    var takenRecipe: Recipe
    
    var body: some View {
        
        ScrollView(.vertical,showsIndicators: false) {
            Text("\(takenRecipe.recipeName)")
                .font(.title)
                .fontWeight(.bold)
            
           
            
            Text("\(takenRecipe.isVeg ? "Vegetarian 🌱" : "Non-Vegetarian 🍗")")
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundStyle(takenRecipe.isVeg ? .green : .orange)
            Divider()

            // Embed the YouTube video using YouTubePlayerView
            let youTubePlayer = YouTubePlayer(source: .url(takenRecipe.youtubeLink))
            YouTubePlayerView(youTubePlayer)
                .aspectRatio(16/9, contentMode: .fit)
            
            Divider()
            
            // Display safe tags for the recipe
            VStack() {
                Text("Safe Tags:")
                    .fontWeight(.bold)
                    //.foregroundStyle(.white)
                ForEach(takenRecipe.safeTags, id: \.self) { tag in
                    Text("\(tag)-safe")
                        .foregroundColor(.white)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 10)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.green.opacity(0.8), Color.green.opacity(0.4)]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(8)
                }
            }
            
            

            Divider()
            
            // Display ingredient list
            VStack {
                Text("Ingredients:")
                    .fontWeight(.bold)
                    
                    
                ForEach(takenRecipe.ingredients, id: \.self) { ingredient in
                    Text("\(ingredient)")
                        .foregroundColor(.white)
                        .padding(.bottom, 5)
                        .padding(.horizontal)
                        .background(
                            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]), startPoint: .leading, endPoint: .trailing)
                        )
                        .cornerRadius(8)
                }
            }
            .padding()

            
            
            Divider()
            
            // Display steps
            
            VStack{
                Text("Steps:")
                    .fontWeight(.bold)
                   // .foregroundStyle(.white)
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(Array(takenRecipe.steps.enumerated()), id: \.offset) { index, step in
                        HStack {
                            Text("STEP \(index + 1)")
                                .font(.headline)
                                .fontWeight(.bold)
                            Text(step)
                                .font(.body)
                        }
                        .foregroundStyle(.green)
                    }
                }
            }
            
            
            Divider()
            
            Spacer()
        }
        .padding()
    }
}



//
//#Preview {
//    RecipeDetailsView(takenRecipe: <#T##Recipe#>)
//}
