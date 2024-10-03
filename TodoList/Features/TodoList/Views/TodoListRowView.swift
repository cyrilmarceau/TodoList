//
//  TodoListRowView.swift
//  TodoList
//
//  Created by Cyril Marceau on 03/10/2024.
//

import SwiftUI

struct TodoListRowView: View {
    let todo: Todo
    
    
    var body: some View {
        
        
        Text(todo.title)
        
    }
}

#Preview {
    TodoListRowView(todo: Todo(title: "Sample Todo", description: "This is a sample todo item", isCompleted: false, createdAt: Date(), updatedAt: Date(), priority: .medium, dueDate: Date().addingTimeInterval(86400), isFavorite: true))
}
