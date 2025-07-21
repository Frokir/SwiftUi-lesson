//
//  TaskItem.swift
//  SwiftUi lesson
//
//  Created by Олег Переплётчиков on 07.08.2025.
//

import Foundation

struct TaskItem: Identifiable, Codable {
    let id = UUID()
    var title: String
    var isCompleted: Bool
}
