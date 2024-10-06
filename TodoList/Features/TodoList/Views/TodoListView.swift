//
//  ContentView.swift
//  TodoList
//
//  Created by Cyril Marceau on 30/09/2024.
//

import OSLog
import SwiftUI

struct TodoListView: View {
    @EnvironmentObject var vm: TodoListViewModel
    @State private var selectedItems = Set<UUID>()
    @State private var showAddTodo: Bool = false
    
    
    var body: some View {
        NavigationView {
            todoList
                .searchable(text: $vm.searchText, prompt: "Search a To-Do")
                .listStyle(.plain)
                .navigationTitle("To-Do List")
                .toolbar {
                    EditToolBarButton
                    OrderToolBarButton
                    AddToolBarButton
            
                }
            
            
        }
    }
    
    private func delete(offsets: IndexSet){
        vm.todoList.remove(atOffsets: offsets)
    }
    
    private var todoList: some View {
        List {
            ForEach(vm.filteredAndSortedTodos) { todo in
                NavigationLink(destination: TodoDetailView(todo: todo)) {
                    TodoListRowView(
                        todo: todo,
                        vm: TodoListViewModel()
                    )
                }
            }.onDelete(perform: delete)
        }
    }
    
    private var EditToolBarButton: ToolbarItem<(), some View> {
        ToolbarItem(placement: .topBarTrailing) {
            EditButton()
        }
    }
    
    private var OrderToolBarButton:  ToolbarItem<(), some View> {
        ToolbarItem(placement: .topBarTrailing){
            Button(action: {
                vm.toggleSortOrder()
            }) {
                Image(systemName: vm.sortOrder.systemImageName)
                
            }
        }
    }
    
    
    private var AddToolBarButton: ToolbarItem<(), some View> {
        ToolbarItem(placement: .topBarTrailing) {
            Button(action: {
                showAddTodo.toggle()
            }) {
                Image(systemName: "plus.circle")
            }.sheet(
                isPresented: $showAddTodo,
                content: {
                    AddTodoView().environmentObject(vm)
                }
            )
        }
    }
}

#Preview {
    TodoListView().environmentObject(TodoListViewModel())
}
