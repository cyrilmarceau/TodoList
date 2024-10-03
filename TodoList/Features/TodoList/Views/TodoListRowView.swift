//
//  TodoListRowView.swift
//  TodoList
//
//  Created by Cyril Marceau on 03/10/2024.
//

import SwiftUI

struct TodoListRowView: View {
    let todo: Todo
    let vm: TodoListViewModel

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Text(todo.title)
                    .font(.headline)
                
                if let dueDate = todo.dueDate {
                    Spacer()
                    dueDateView
                }
            }
            Text(todo.description)
                .font(.subheadline)
                .lineLimit(2)
        }
    }
    
    private var dueDateView: some View {
        Text(todo.dueDate?.formatted(
                date: .abbreviated,
                time: .omitted) ?? ""
            ).font(.caption)
            .padding(.trailing, 10)
        
        
        
    }
}

#Preview {
    TodoListRowView(todo: Todo(title: "Sample Todo", description: "This is a sample todo item", isCompleted: false, createdAt: Date(), updatedAt: Date(), priority: .medium, dueDate: Date().addingTimeInterval(86400), isFavorite: true), vm: TodoListViewModel())
}
