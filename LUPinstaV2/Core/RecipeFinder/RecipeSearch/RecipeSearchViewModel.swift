//
//  RecipeSearchViewModel.swift
//  TrialRoom
//
//  Created by Joaquim Menezes on 21/04/24.
//

import Foundation

class RecipeSearchViewModel: ObservableObject {
    @Published var searchTerm = ""
    @Published var recipes: [Recipe] = [
        
        // Add more mock recipes as needed
        Recipe(id: "aaaa", ingredients: ["chicken", "butter", "salt", "pepper"],
               recipeName: "Chicken Tandoori",
               safeTags: ["diabetic","hypertension"],
               steps: ["prepare chicken tandoori", "cook chicken tandoori", "serve chicken tandoori"],
               youtubeLink: "https://youtu.be/a03U45jFxOI?si=GYTrXHgZQAgp5yp6",
               imageLink: "https://crockpot-app-prod.s3.ap-southeast-2.amazonaws.com/butter-chicken-1800x800_7b5d0f1593.jpeg",
               isVeg: true),
        
        Recipe(id: "aaaa", ingredients: ["chicken", "butter", "salt", "pepper"],
               recipeName: "Chicken Soup",
               safeTags: ["diabetic","hypertension"],
               steps: ["boil chicken soup", "serve chicken soup"],
               youtubeLink: "https://youtu.be/a03U45jFxOI?si=GYTrXHgZQAgp5yp6",
               imageLink: "https://crockpot-app-prod.s3.ap-southeast-2.amazonaws.com/butter-chicken-1800x800_7b5d0f1593.jpeg",
               isVeg: false),
        
        Recipe(id: "aaaaa", ingredients: ["chicken", "butter", "salt", "pepper"],
               recipeName: "Chicken Fries",
               safeTags: ["diabetic","hypertension"],
               steps: ["prepare chicken fries", "cook chicken fries", "serve chicken fries"],
               youtubeLink: "https://youtu.be/a03U45jFxOI?si=GYTrXHgZQAgp5yp6",
               imageLink: "https://crockpot-app-prod.s3.ap-southeast-2.amazonaws.com/butter-chicken-1800x800_7b5d0f1593.jpeg",
               isVeg: true),
        
        
    ]
}
