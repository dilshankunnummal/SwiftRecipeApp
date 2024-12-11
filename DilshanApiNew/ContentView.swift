//
//  ContentView.swift
//  DilshanApiNew
//
//  Created by Adhil Hamid on 08/12/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        TabView {
            HomeScreen(viewModel: viewModel).tabItem {
                Image(systemName: "person")
                Text("Home")
            }
            FavouriteScreen(viewModel: viewModel).tabItem {
                Image(systemName: "star")
                Text("Favourite")
            }
        }
    }
}

#Preview {
    ContentView()
}
