//
//  TaskItem.swift
//  SwiftUi lesson
//
//  Created by Олег Переплётчиков on 07.08.2025.
//

import Foundation

struct TaskItem: Identifiable, Codable {
    var id: UUID
    var title: String
    var note: String
    var isCompleted: Bool

    init(id: UUID = UUID(), title: String, note: String = "", isCompleted: Bool = false) {
        self.id = id
        self.title = title
        self.note = note
        self.isCompleted = isCompleted
    }
}
