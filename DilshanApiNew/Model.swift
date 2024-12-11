//
//  Model.swift
//  DilshanApiNew
//
//  Created by Adhil Hamid on 08/12/24.
//

import Foundation

struct Model : Codable {
    let results: [RecipeItem]
}

struct RecipeItem: Codable, Identifiable {
    let id: Int
    let title: String
    let image: String
    let imageType: String
    let nutrition: Nutrition?
}

struct Nutrition: Codable{
    let nutrients: [Nutrients]
}

struct Nutrients : Codable {
    let name: String
    let amount: Double
    let unit: String
}


