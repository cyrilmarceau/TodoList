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
    
    private var filteredTodo: [Todo] {
        searchText.isEmpty ? vm.todoList : vm.todoList.filter {
            $0.title.contains(searchText)
        }
    }
    
    var body: some View {
        NavigationView {
            todoList
            .searchable(text: $searchText, prompt: "Search a To-Do")
            .listStyle(.plain)
            .navigationTitle("To-Do List")
            .toolbar {
                addButton
            }
        }
    }
    
    private var todoList: some View {
        List {
            ForEach(filteredTodo) { todo in
                NavigationLink(destination: TodoDetailView(todo: todo)) {
                    TodoListRowView(todo: todo)
                }
            }
        }
    }
    
    private var addButton: some View {
        Button(action: {
            showAddTodo.toggle()}
        ){
            Image(systemName: "plus")
        }
        .sheet(
            isPresented: $showAddTodo,
            content: {
                AddTodoView().environmentObject(vm)
            }
        )
    }
}


#Preview {
    TodoListView().environmentObject(TodoListViewModel())
}
