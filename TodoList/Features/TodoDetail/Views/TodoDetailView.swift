//
//  TodoDetailView.swift
//  TodoList
//
//  Created by Cyril Marceau on 30/09/2024.
//

import SwiftUI

struct TodoDetailView: View {
    let todo: Todo
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    TodoDetailView(
        todo: Todo(
            title: "Faire les courses",
            description: "Acheter des fruits, légumes et du pain",
            isCompleted: false,
            createdAt: Date(),
            updatedAt: Date(),
            priority: .medium,
            dueDate: Calendar.current.date(byAdding: .day, value: 1, to: Date()),
            isFavorite: false
        )
    )
}
