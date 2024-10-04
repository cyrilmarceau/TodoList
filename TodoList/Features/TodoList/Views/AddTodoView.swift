//
//  AddTodoView.swift
//  TodoList
//
//  Created by Cyril Marceau on 02/10/2024.
//

import SwiftUI


struct AddTodoView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var vm: TodoListViewModel
    
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var dueDate = Date()
    @State private var priority: PriorityEnum = .high
    @State private var isFavorite: Bool = false
    
    var disableForm: Bool {
        title.isEmpty || description.isEmpty
    }
    
    
    
    
    var body: some View {
        NavigationStack {
#if DEBUG
            Button("Prefilled form inputs", action: prefilledFormInputs)
#endif
            
            Form {
                TextField(text: $title) {
                    Text("Hi, I'm a placeholder text.")
                }
                ZStack(alignment: .leading) {
                    if description.isEmpty {
                        VStack {
                            Text("Write something...")
                                .padding(.top, 10)
                                .padding(.leading, 4)
                                .foregroundColor(Color(UIColor.placeholderText))
                            Spacer()
                        }
                    }
                    
                    VStack {
                        TextEditor(text: $description)
                            .frame(minHeight: 150)
                            .opacity(1)
                        Spacer()
                    }
                }
                DatePicker("Due date", selection: $dueDate, in: Date.now... , displayedComponents: .date)
                Picker("Priority", selection: $priority) {
                    ForEach(PriorityEnum.allCases, id: \.self) { priority in
                        Text(priority.rawValue).tag(priority)
                    }
                }
                Toggle("Favorite", isOn: $isFavorite)
                
            }
            .navigationTitle("Add a Todo")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark.circle")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        let td = Todo(
                            title: title,
                            description: description,
                            isCompleted: false,
                            createdAt: Date(),
                            updatedAt: Date(),
                            priority: PriorityEnum.high,
                            dueDate: dueDate,
                            isFavorite: isFavorite
                        )
                        
                        vm.addTodo(todo: td)
                        
                        dismiss()
                    }) {
                        Text("Save")
                    }.disabled(disableForm)
                }
            }
            
        }
    }
    
    private func prefilledFormInputs() {
        title = "Hello \(vm.todoList.count)"
        description = "World \(vm.todoList.count)"
        dueDate = Date().addingTimeInterval(TimeInterval(86400 * Int.random(in: 1..<60)))
        priority = PriorityEnum.random()
        isFavorite = arc4random_uniform(2) == 0
    }
}

#Preview {
    AddTodoView()
}
