//
//  TodoDetailView.swift
//  TodoList
//
//  Created by Cyril Marceau on 30/09/2024.
//

import SwiftUI

struct TodoDetailView: View {
    @EnvironmentObject var vm: TodoListViewModel
    @Binding var todo: Todo
    @Environment(\.dismiss) private var dismiss
    @State private var isEditing = false
    
    
    var body: some View {
        
        NavigationView {
            List {
                Section {
                    HStack {
                        Text(todo.title)
                            .font(.headline)
                        Spacer()
                        Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(todo.isCompleted ? .green : .gray)
                        
                    }
                    
                    Text(todo.description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Section {
                    HStack {
                        Label("Priority", systemImage: "flag.fill")
                        Spacer()
                        Text(todo.priority.rawValue)
                            .foregroundColor(todo.priority.toColor)
                    }
                    
                    HStack {
                        Label("Due Date", systemImage: "calendar")
                        Spacer()
                        Text(todo.dueDate, style: .date)
                    }
                }
                
                Section {
                    HStack {
                        Label("Created", systemImage: "clock")
                        Spacer()
                        Text(todo.createdAt, style: .date)
                    }
                    
                    HStack {
                        Label("Updated", systemImage: "clock.arrow.circlepath")
                        Spacer()
                        Text(todo.createdAt, style: .date)
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem {
                Button("Done"){
                    dismiss()
                }
            }
            ToolbarItem {
                Button("Edit"){
                    isEditing.toggle()
                }.sheet(
                    isPresented: $isEditing,
                    content: {
                        EditTodoView(todo: $todo).environmentObject(vm)
                    }
                )
            }
            ToolbarItem {
                Button(action: {
                    vm.toggleToFavorite(todo: todo)
                }) {
                    Label("Favorite", systemImage: todo.isFavorite ? "heart.fill": "heart")
                }
            }
        }
    }
    
    
}

#Preview {
    TodoDetailView(
        todo: .constant(Todo(
            title: "Faire les courses",
            description: "Acheter des fruits, légumes et du pain",
            isCompleted: false,
            createdAt: Date(),
            updatedAt: Date(),
            priority: .medium,
            dueDate: Date().addingTimeInterval(60 * 60 * 24),
            isFavorite: false
        ))
    )
}
