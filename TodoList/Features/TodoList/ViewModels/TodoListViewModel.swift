//
//  TodoListViewModel.swift
//  TodoList
//
//  Created by Cyril Marceau on 30/09/2024.
//

import Foundation
import SwiftUI

class TodoListViewModel: ObservableObject {
    
    @Published var searchText: String = ""
    @Published var sortOrder: SortOrder = .DESC
    
    @Published var todoList: [Todo] = [] {
        didSet {
            saveTodos()
        }
    }
    
    enum SortOrder {
        case ASC
        case DESC

        var systemImageName: String {
            switch self {
                case .ASC: return "arrow.up.circle"
                case .DESC: return "arrow.down.circle"
            }
        }
    }
    
    init() {
        loadTodos()
    }
    
    
    var filteredAndSortedTodos: [Todo] {
        let filteredTodos = searchText.isEmpty ? todoList : todoList.filter {
            $0.title.localizedStandardContains(searchText)
        }
        
        return filteredTodos.sorted { sort1, sort2 in
            switch sortOrder {
            case .ASC:
                return sort1.dueDate < sort2.dueDate
            case .DESC:
                return sort1.dueDate > sort2.dueDate
            }
            
        }

    }
    
    func toggleSort() {
        sortOrder = sortOrder == .ASC ? .DESC : .ASC
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
