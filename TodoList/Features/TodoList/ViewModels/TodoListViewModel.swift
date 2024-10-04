//
//  TodoListViewModel.swift
//  TodoList
//
//  Created by Cyril Marceau on 30/09/2024.
//

import Foundation
import SwiftUI

class TodoListViewModel: ObservableObject {
    
    @Published var todoList: [Todo] = [] {
        didSet {
            saveTodos()
        }
    }
    
    init() {
        loadTodos() 
    }
    
    func addTodo(todo: Todo){
        todoList.append(todo)
    }
    

    private func saveTodos() {
        if let encodedData = try? JSONEncoder().encode(todoList) {
            UserDefaults.standard.set(encodedData, forKey: "todoList")
        }
    }
    
    private func loadTodos() {
        if let savedTodos = UserDefaults.standard.data(forKey: "todoList"),
           let decodedTodos = try? JSONDecoder().decode([Todo].self, from: savedTodos) {
            todoList = decodedTodos
        }
    }
    
}
