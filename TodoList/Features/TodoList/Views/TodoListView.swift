//
//  ContentView.swift
//  TodoList
//
//  Created by Cyril Marceau on 30/09/2024.
//

import SwiftUI
import OSLog

struct TodoListView: View {
    
    @EnvironmentObject var vm: TodoListViewModel
    
    @State private var searchText: String = ""
    @State private var showAddTodo: Bool = true
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.white
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        
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
                    showAddTodo.toggle()
                }) {
                    Image(systemName: "plus")
                }.sheet(isPresented: $showAddTodo) {
                    AddTodoView().environmentObject(vm)
                    
                    //                    NavigationStack {
                    
                    //                        Text("Hello").navigationTitle("Add a Todo")
                    //                            .navigationBarTitleDisplayMode(.inline)
                    //                            .toolbar {
                    //                                ToolbarItem(placement: .topBarLeading) {
                    //                                    Button(action: {
                    //                                        showAddTodo.toggle()
                    //                                    }) {
                    //                                        Image(systemName: "xmark.circle")
                    //                                    }
                    //                                }
                    //                                ToolbarItem(placement: .topBarTrailing) {
                    //                                    Button(action: {
                    //
                    //                                        var td = Todo(
                    //                                            title: "az",
                    //                                            description: "ez",
                    //                                            isCompleted: false,
                    //                                            createdAt: Date(),
                    //                                            updatedAt: Date(),
                    //                                            priority: PriorityEnum.high,
                    //                                            dueDate: Date(),
                    //                                            isFavorite: false
                    //                                        )
                    //                                        vm.addTodo(todo: td)
                    //                                        showAddTodo.toggle()
                    //
                    //                                    }) {
                    //                                        Text("Save")
                    //                                    }
                    //                                }
                    //                            }
                    
                    //                    }
                    
                }
            }
        }
    }
}


#Preview {
    TodoListView().environmentObject(TodoListViewModel())
}
