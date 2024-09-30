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
            NavigationView {
                TodoListView()
            }.tabItem {
                Label("Home", systemImage: "house")
            }

            NavigationView {
                FavoriteTodoView()
            }.tabItem {
                Label("Favorites", systemImage: "star")
            }

            NavigationView {
                SettingsView()
            }.tabItem {
                Label("Settings", systemImage: "gear")
            }
        }

    }
}

#Preview {
    ContentView()
}
