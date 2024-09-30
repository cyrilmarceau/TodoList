//
//  ContentView.swift
//  TodoList
//
//  Created by Cyril Marceau on 30/09/2024.
//

import SwiftUI
import OSLog

struct TodoListView: View {
    
    let todos = [
        Todo(
            title: "Faire les courses",
            description: "Acheter des fruits, légumes et du pain",
            isCompleted: false,
            createdAt: Date(),
            updatedAt: Date(),
            priority: .medium,
            dueDate: Calendar.current.date(byAdding: .day, value: 1, to: Date()),
            isFavorite: false
        ),
        Todo(
            title: "Réviser pour l'examen",
            description: "Revoir les chapitres 3 à 5 du cours de mathématiques",
            isCompleted: false,
            createdAt: Date(),
            updatedAt: Date(),
            priority: .high,
            dueDate: Calendar.current.date(byAdding: .day, value: 5, to: Date()),
            isFavorite: false
        ),
        Todo(
            title: "Appeler le plombier",
            description: "Prendre rendez-vous pour réparer le robinet qui fuit",
            isCompleted: false,
            createdAt: Date(),
            updatedAt: Date(),
            priority: .low,
            dueDate: Calendar.current.date(byAdding: .day, value: 3, to: Date()),
            isFavorite: false
        ),
        Todo(
            title: "Faire du sport",
            description: "30 minutes de jogging dans le parc",
            isCompleted: false,
            createdAt: Date(),
            updatedAt: Date(),
            priority: .medium,
            dueDate: Calendar.current.date(byAdding: .day, value: 1, to: Date()),
            isFavorite: false
        ),
        Todo(
            title: "Payer les factures",
            description: "Régler les factures d'électricité et d'internet",
            isCompleted: false,
            createdAt: Date(),
            updatedAt: Date(),
            priority: .high,
            dueDate: Calendar.current.date(byAdding: .day, value: 2, to: Date()),
            isFavorite: false
        ),
        Todo(
            title: "Nettoyer la maison",
            description: "Passer l'aspirateur et faire la poussière",
            isCompleted: false,
            createdAt: Date(),
            updatedAt: Date(),
            priority: .low,
            dueDate: nil,
            isFavorite: false
        ),
        Todo(
            title: "Préparer la présentation",
            description: "Finaliser les diapositives pour la réunion de vendredi",
            isCompleted: false,
            createdAt: Date(),
            updatedAt: Date(),
            priority: .high,
            dueDate: Calendar.current.date(byAdding: .day, value: 4, to: Date()),
            isFavorite: false
        ),
        Todo(
            title: "Faire les courses",
            description: "Acheter des fruits, légumes et du pain",
            isCompleted: false,
            createdAt: Date(),
            updatedAt: Date(),
            priority: .medium,
            dueDate: Calendar.current.date(byAdding: .day, value: 1, to: Date()),
            isFavorite: false
        ),
        Todo(
            title: "Réviser pour l'examen",
            description: "Revoir les chapitres 3 à 5 du cours de mathématiques",
            isCompleted: false,
            createdAt: Date(),
            updatedAt: Date(),
            priority: .high,
            dueDate: Calendar.current.date(byAdding: .day, value: 5, to: Date()),
            isFavorite: false
        ),
        Todo(
            title: "Appeler le plombier",
            description: "Prendre rendez-vous pour réparer le robinet qui fuit",
            isCompleted: false,
            createdAt: Date(),
            updatedAt: Date(),
            priority: .low,
            dueDate: Calendar.current.date(byAdding: .day, value: 3, to: Date()),
            isFavorite: false
        ),
        Todo(
            title: "Faire du sport",
            description: "30 minutes de jogging dans le parc",
            isCompleted: false,
            createdAt: Date(),
            updatedAt: Date(),
            priority: .medium,
            dueDate: Calendar.current.date(byAdding: .day, value: 1, to: Date()),
            isFavorite: false
        ),
        Todo(
            title: "Payer les factures",
            description: "Régler les factures d'électricité et d'internet",
            isCompleted: false,
            createdAt: Date(),
            updatedAt: Date(),
            priority: .high,
            dueDate: Calendar.current.date(byAdding: .day, value: 2, to: Date()),
            isFavorite: false
        ),
        Todo(
            title: "Nettoyer la maison",
            description: "Passer l'aspirateur et faire la poussière",
            isCompleted: false,
            createdAt: Date(),
            updatedAt: Date(),
            priority: .low,
            dueDate: nil,
            isFavorite: false
        ),
        Todo(
            title: "Préparer la présentation",
            description: "Finaliser les diapositives pour la réunion de vendredi",
            isCompleted: false,
            createdAt: Date(),
            updatedAt: Date(),
            priority: .high,
            dueDate: Calendar.current.date(byAdding: .day, value: 4, to: Date()),
            isFavorite: false
        )
    ]
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.white  // Set your color here
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]  // Optional: Change title text color
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]  // Optional: For large title
        
        // Apply the appearance settings to UINavigationBar
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
    }
    
    private func addToFavorite() {
        
    }
    
    private func remove() {
        
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(todos) { todo in
                    NavigationLink(
                        destination: TodoDetailView(todo: todo)
                    ) {
                        VStack(alignment: .leading){
                            Text(todo.title).font(.headline)
                            Text(todo.description).font(.subheadline)
                            
                        }.contextMenu{
                            Button(action: addToFavorite) {
                                Label("Add to Favorites", systemImage: "heart")
                            }
                            Button(role: .destructive, action: remove) {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                    }
                }
            }
        }
        .listStyle(.plain)
        .navigationTitle("To-Do List")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button(action: {
                // Action for adding item
            }) {
                Image(systemName: "plus")
            }
        }
        
        
    }
}

#Preview {
    TodoListView()
}
