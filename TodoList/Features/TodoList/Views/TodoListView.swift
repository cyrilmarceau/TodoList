//
//  ContentView.swift
//  TodoList
//
//  Created by Cyril Marceau on 30/09/2024.
//

import SwiftUI
import OSLog

struct TodoListView: View {
    
    @StateObject private var vm = TodoListViewModel()
    @State private var searchText: String = ""
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.white  // Set your color here
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]  // Optional: Change title text color
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]  // Optional: For large title
        
        // Apply the appearance settings to UINavigationBar
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
    }
    
    private func addToFavorite() {
        
    }
    
    private func remove() {
        
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.todoList.filter {searchText.isEmpty ? true : $0.title.contains(searchText)}) { todo in
                    NavigationLink(
                        destination: TodoDetailView(todo: todo)
                    ) {
                        VStack(alignment: .leading){
                            Text(todo.title).font(.headline)
                            Text(todo.description).font(.subheadline)
                        }.contextMenu{
                            Button(action: addToFavorite) {
                                Label("Add to Favorites", systemImage: "heart")
                            }
                            Button(role: .destructive, action: {
                                vm.removeTodo(id: todo.id)
                            }) {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                    }
                }
            }
            .searchable(text: $searchText, prompt: "Search a To-Do")
            .listStyle(.plain)
            .navigationTitle("To-Do List")
            .toolbar {
                Button(action: {
                    // Action for adding item
                }) {
                    Image(systemName: "plus")
                }
            }
        }
    }
}


#Preview {
    TodoListView()
}
