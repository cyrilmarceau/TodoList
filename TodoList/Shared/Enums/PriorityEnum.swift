//
//  PriorityEnum.swift
//  TodoList
//
//  Created by Cyril Marceau on 30/09/2024.
//

import Foundation
import SwiftUI

enum PriorityEnum: String, Codable, CaseIterable {
    case high, medium, low
    
    static func random() -> PriorityEnum {
        return allCases.randomElement()!
    }
    
    var toColor: Color {
        switch self {
        case .low: return .blue
        case .medium: return .orange
        case .high: return .red
        }
    }
    
    var id: Self { self }
}
