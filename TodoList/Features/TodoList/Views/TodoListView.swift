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
    @State private var showAddTodo: Bool = false
    
    
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
    
    
    private func toggleFavorite() {}
    private func deleteTodo() {}
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.todoList.filter {searchText.isEmpty ? true : $0.title.contains(searchText)}) { todo in
                    NavigationLink(
                        destination: TodoDetailView(todo: todo)
                    ) {
                        var priorityColor: Color {
                            switch todo.priority {
                            case .low: return .blue
                            case .medium: return .orange
                            case .high: return .red
                            }
                        }
                        HStack(spacing: 16) {
                            Circle()
                                .fill(priorityColor)
                                .frame(width: 12, height: 12)
                        }
                        VStack(alignment: .leading, spacing: 4) {
                            Text(todo.title)
                                .font(.headline).foregroundColor(.primary)
                            Text(todo.description)
                                .font(.subheadline).foregroundColor(.secondary)
                            
                            HStack {
                                if let dueDate = todo.dueDate {
                                    Label(dueDate.formatted(date: .abbreviated, time: .omitted), systemImage: "calendar").font(.caption).foregroundColor(.secondary)
                                }
                                
                                Spacer()
                                
                                if todo.isFavorite {
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                }
                            }
                        }
                        Spacer()
                        
                        Image(systemName: todo.isCompleted ? "checkmark.circle.fill": "circle")
                            .foregroundColor(todo.isCompleted ? .green : .secondary)
                    }.contextMenu{
                        Button(action: {}) {
                            Label(todo.isFavorite ? "Remove from Favorites" : "Add to Favorites", systemImage: todo.isFavorite ? "star.slash" : "star")
                        }
                        Button(action: {}) {
                            Label(todo.isCompleted ? "Mark as Incomplete" : "Mark as Complete", systemImage: todo.isCompleted ? "circle" : "checkmark.circle")
                        }
                        Button(role: .destructive, action: {}) {
                            Label("Delete", systemImage: "trash")
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
                }
            }
        }
    }
}


#Preview {
    TodoListView().environmentObject(TodoListViewModel())
}
