//
//  PriorityEnum.swift
//  TodoList
//
//  Created by Cyril Marceau on 30/09/2024.
//

import Foundation

enum PriorityEnum: String, Codable, CaseIterable {
    case high, medium, low
    
    static func random() -> PriorityEnum {
        return allCases.randomElement()!
    }
    
    var id: Self { self }
}
