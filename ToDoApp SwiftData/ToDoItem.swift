//
//  ToDoItem.swift
//  ToDoApp SwiftData
//
//  Created by YAUHENI LEVIN on 13.08.23.
//

import SwiftData
import Foundation

@Model class ToDoItem: Identifiable {
    var id: UUID
    var name: String
    var isComplete: Bool
    
    init(id: UUID = UUID(), name: String = "", isComplete: Bool = false) {
        self.id = id
        self.name = name
        self.isComplete = isComplete
    }
}
