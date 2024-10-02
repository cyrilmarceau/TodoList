//
//  TodoListViewModel.swift
//  TodoList
//
//  Created by Cyril Marceau on 30/09/2024.
//

import Foundation

class TodoListViewModel: ObservableObject {
    
    @Published var todoList: [Todo] = []
    
    func addTodo(todo: Todo){
        
        todoList.append(todo)
        
        print(todoList.count)
    }
    
    func removeTodo(id: UUID){
        return todoList.removeAll(where: { $0.id == id })
    }

    
    
    
    
}
