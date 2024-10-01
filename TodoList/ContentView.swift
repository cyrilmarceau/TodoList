//
//  ContentView.swift
//  TodoList
//
//  Created by Cyril Marceau on 30/09/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TodoListView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            FavoriteTodoView()
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
        
    }
}

#Preview {
    ContentView()
}
