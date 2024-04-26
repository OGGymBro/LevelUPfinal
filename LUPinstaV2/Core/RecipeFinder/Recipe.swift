//
//  Recipe.swift
//  TrialRoom
//
//  Created by Joaquim Menezes on 21/04/24.
//
import Foundation

struct Recipe: Codable, Hashable, Identifiable {
    var id :String // Add an id property of type UUID
    
    var ingredients: [String]
    let recipeName: String
    var safeTags: [String]
    var steps: [String]
    var youtubeLink: String
    var imageLink: String
    var isVeg: Bool
}
