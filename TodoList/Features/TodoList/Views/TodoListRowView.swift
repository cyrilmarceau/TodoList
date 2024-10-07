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
                    Spacer()
                    dueDateView
             
            }
            Text(todo.description)
                .font(.subheadline)
                .lineLimit(2)
        }.swipeActions(edge: .leading) {
            Button {
                vm.toggleToFavorite(todo: todo)
            } label: {
                if todo.isFavorite {
                    Label("Read", systemImage: "envelope.open")
                } else {
                    Label("Unread", systemImage: "envelope.badge")
                }
            }
        }
    }
    
    private var dueDateView: some View {
        Text(todo.dueDate.formatted(
                date: .abbreviated,
                time: .omitted)
            ).font(.caption)
            .padding(.trailing, 10)
        
        
        
    }
}

#Preview {
    TodoListRowView(todo: Todo(title: "Sample Todo", description: "This is a sample todo item", isCompleted: false, createdAt: Date(), updatedAt: Date(), priority: .medium, dueDate: Date().addingTimeInterval(86400), isFavorite: true), vm: TodoListViewModel())
}
