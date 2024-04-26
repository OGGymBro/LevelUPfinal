//
//  RecipeBaseViewModel.swift
//  TrialRoom
//
//  Created by Joaquim Menezes on 21/04/24.
//

import Foundation
import Firebase

class RecipeBaseViewModel: ObservableObject {

    //filter recipes based on the current users safe tags
    
    //also fetch current users safe tags to display
    
    init() {
        Task {
            //try await fetchAllUsers()
             fetchData()
        }
    }
    
    @Published var currentUserSafeTags :[String] = ["diabetic","hypertension"]
//    @Published var recipes: [Recipe] = [
//        
//        // Add more mock recipes as needed
//        Recipe(ingredients: ["chicken", "butter", "salt", "pepper"],
//               recipeName: "Chicken Tandoori",
//               safeTags: ["diabetic","hypertension"],
//               steps: ["prepare chicken tandoori", "cook chicken tandoori", "serve chicken tandoori"],
//               youtubeLink: "https://youtu.be/a03U45jFxOI?si=GYTrXHgZQAgp5yp6",
//               imageLink: "https://crockpot-app-prod.s3.ap-southeast-2.amazonaws.com/butter-chicken-1800x800_7b5d0f1593.jpeg",
//               isVeg: true),
//        
//        Recipe(ingredients: ["chicken", "butter", "salt", "pepper"],
//               recipeName: "Chicken Soup",
//               safeTags: ["diabetic","hypertension"],
//               steps: ["boil chicken soup", "serve chicken soup"],
//               youtubeLink: "https://youtu.be/a03U45jFxOI?si=GYTrXHgZQAgp5yp6",
//               imageLink: "https://crockpot-app-prod.s3.ap-southeast-2.amazonaws.com/butter-chicken-1800x800_7b5d0f1593.jpeg",
//               isVeg: false),
//        
//        Recipe(ingredients: ["chicken", "butter", "salt", "pepper"],
//               recipeName: "Chicken Fries",
//               safeTags: ["diabetic","hypertension"],
//               steps: ["prepare chicken fries", "cook chicken fries", "serve chicken fries"],
//               youtubeLink: "https://youtu.be/a03U45jFxOI?si=GYTrXHgZQAgp5yp6",
//               imageLink: "https://crockpot-app-prod.s3.ap-southeast-2.amazonaws.com/butter-chicken-1800x800_7b5d0f1593.jpeg",
//               isVeg: true),
//        
//        
//    ]
    @Published var recipes = [Recipe]()
    
    private var db = Firestore.firestore()
    
    func fetchData() {
        db.collection("recipes").getDocuments { querySnapshot, error in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                for document in querySnapshot!.documents {
                    do {
                        let recipe = try document.data(as: Recipe?.self)
                        if let recipe = recipe {
                            DispatchQueue.main.async {
                                self.recipes.append(recipe)
                            }
                        } else {
                            print("Document exists but cannot be decoded into Recipe")
                        }
                    } catch {
                        print("Error decoding recipe: \(error)")
                    }
                }
            }
        }
    }


    
    func fetchCurrentUserSafeTags() {
        // Fetch the user's safe tags
    }
    
    func fetchRecipesTailoredForCurrentUser(){
        // Fetch recipes based on the user's safe tags
    }
    
}
