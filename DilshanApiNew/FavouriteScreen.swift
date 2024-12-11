//
//  FavouriteScreen.swift
//  DilshanApiNew
//
//  Created by Adhil Hamid on 08/12/24.
//

import SwiftUI


struct FavouriteScreen: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.favList) { item in
                    Text(item.title)
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle("Favourites")
            .toolbar {
                EditButton()
            }
        }
    }
    
    private func deleteItems(at offsets: IndexSet) {
        viewModel.favList.remove(atOffsets: offsets)
    }
}

#Preview {
    FavouriteScreen(viewModel: ViewModel())
}
