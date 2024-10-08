//
//  EditTodoView.swift
//  TodoList
//
//  Created by MARCEAU Cyril on 08/10/2024.
//
import SwiftUI


struct EditTodoView: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var todo: Todo
    @EnvironmentObject var vm: TodoListViewModel
    
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var dueDate = Date()
    @State private var priority: PriorityEnum = .high
    @State private var isFavorite: Bool = false
    
    
    init(todo: Binding<Todo>){
        _todo = todo
        _title = State(initialValue: todo.wrappedValue.title)
        _description = State(initialValue: todo.wrappedValue.description)
        _dueDate = State(initialValue: todo.wrappedValue.dueDate)
        _priority = State(initialValue: todo.wrappedValue.priority)
        _isFavorite = State(initialValue: todo.wrappedValue.isFavorite)
    }

    
    var disableForm: Bool {
        title.isEmpty || description.isEmpty
    }
    
    var body: some View {
        NavigationStack {NavigationStack {
            VStack(spacing: 0) {
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
            }
        }
        .navigationTitle("Edit a Todo")
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
