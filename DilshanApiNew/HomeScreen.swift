//
//  HomeScreen.swift
//  DilshanApiNew
//
//  Created by Adhil Hamid on 08/12/24.
//

import SwiftUI

struct HomeScreen: View {
    @State var searchText = ""

    @ObservedObject var viewModel = ViewModel()
    
    var filteredItem: [RecipeItem] {
        if searchText.isEmpty {
            return viewModel.recipeList
        } else {
            return viewModel.recipeList.filter {
                $0.title.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationView{
            List(filteredItem) {
                item in
                NavigationLink(destination: DetailScreen(viewModel: viewModel, details: item)) {
                    Text(item.title)

                }
            }.searchable(text: $searchText)
        }
    }
}

#Preview {
    HomeScreen()
}
