//
//  DetailScreen.swift
//  DilshanApiNew
//
//  Created by Adhil Hamid on 08/12/24.
//

import SwiftUI
struct DetailScreen: View {
    
    @ObservedObject var viewModel = ViewModel()
    var details: RecipeItem
    
    var body: some View {
        NavigationView{
            VStack{
                AsyncImage(url: URL(string: details.image)){ image in
                    image.resizable().frame(width: 200, height: 100).clipShape(Rectangle())
                } placeholder: {
                    ProgressView()
                }
                Text(details.title)
                Button("Add to favorite"){
                    viewModel.addFav(details)
                }.background(Color.blue).foregroundColor(Color.white).frame(width: 300, height: 50).cornerRadius(20)

            }.navigationTitle(details.title)

        }
        
    }
}

//#Preview {
//    DetailScreen()
//}
