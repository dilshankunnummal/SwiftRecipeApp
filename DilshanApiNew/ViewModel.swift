//
//  ViewModel.swift
//  DilshanApiNew
//
//  Created by Adhil Hamid on 08/12/24.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var recipeList : [RecipeItem] = []
    @Published var favList : [RecipeItem] = []
    
    init () {
        fetchData()
    }
    
    func fetchData(){
        
        let url = URL(string: "https://api.spoonacular.com/recipes/complexSearch?query=pasta&maxFat=25&number=2&apiKey=091d9ef127b244cfa5d245207926cb65")
        
        let dataTask = URLSession.shared.dataTask(with: url!) { data, response, error in
            if error == nil && data != nil {
                let recordItem = try! JSONDecoder().decode(Model.self, from: data!)
                DispatchQueue.main.async {
                    self.recipeList = recordItem.results
                }
            }
        }
        dataTask.resume()
    }
    
    func addFav(_ item: RecipeItem){
        if !favList.contains(where: {$0.id == item.id}) {
            favList.append(item)
        }
    }
}
