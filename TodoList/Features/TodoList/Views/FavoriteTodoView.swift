//
//  FavoriteTodoView.swift
//  TodoList
//
//  Created by Cyril Marceau on 30/09/2024.
//

import SwiftUI

struct FavoriteTodoView: View {
    
    @EnvironmentObject var vm: TodoListViewModel
    @State private var selectedItems = Set<UUID>()
    @State private var showAddTodo: Bool = false
    
    var body: some View {
        NavigationView {
            todoList
                .searchable(text: $vm.searchText, prompt: "Search a Todo")
                .listStyle(.plain)
                .navigationTitle("In favorites (\(vm.favoritesFilteredAndSortedTodos.count))")
                .toolbar {
                    Menu {
                        EditToolBarButton
                        AddToolBarButton
                        OrderToolBarButton
                      
                    } label : {
                        Label("Options", systemImage: "ellipsis.circle")
                    }.sheet(
                        isPresented: $showAddTodo,
                        content: {
                            AddTodoView().environmentObject(vm)
                        }
                    )
                }
        }
    }
    
    private func delete(offsets: IndexSet){
        vm.todoList.remove(atOffsets: offsets)
    }
    
    private var todoList: some View {
        List {
            ForEach(vm.favoritesFilteredAndSortedTodos) { todo in
                NavigationLink(destination: TodoDetailView(todo: .constant(todo))) {
                    TodoListRowView(
                        todo: .constant(todo),
                        vm: .constant(TodoListViewModel())
                    )
                }
            }.onDelete(perform: delete)
        }
    }
    
    private var EditToolBarButton: some View {
        EditButton()
    }
    
    private var OrderToolBarButton: some View {
        Button(action: {
            vm.toggleSortOrder()
        }) {
            Label(vm.sortOrder.labelTextName, systemImage: vm.sortOrder.systemImageName)
        }
    }
    
    private var AddToolBarButton: some View {
        Button(action: {
            showAddTodo.toggle()
        }) {
            Label("Add new one", systemImage: "plus.circle")
        }
    }
}

#Preview {
    FavoriteTodoView().environmentObject(TodoListViewModel())
}
