//
//  Task.swift
//  TodoList
//
//  Created by Cyril Marceau on 30/09/2024.
//

import Foundation

struct Todo: Identifiable, Encodable, Decodable {
    var id = UUID()
    let title: String
    let description: String
    let isCompleted: Bool
    let createdAt: Date
    let updatedAt: Date
    let priority: PriorityEnum
    let dueDate: Date?
    let isFavorite: Bool
}
