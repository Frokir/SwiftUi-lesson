//
//  TaskRowView.swift
//  SwiftUi lesson
//
//  Created by Олег Переплётчиков on 07.08.2025.
//

import SwiftUI

struct TaskRowView: View {
    let task: TaskItem
    let toggleCompletion: () -> Void

    var body: some View {
        HStack(alignment: .top) {
            Button(action: toggleCompletion) {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(task.isCompleted ? .green : .gray)
                    .imageScale(.large)
            }
            .buttonStyle(.plain)

            VStack(alignment: .leading, spacing: 2) {
                Text(task.title)
                    .font(.headline)
                    .foregroundColor(task.isCompleted ? .gray : .primary)
                    .strikethrough(task.isCompleted)
                if !task.note.isEmpty {
                    Text(task.note)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                }
            }

            Spacer()
        }
        .padding(.vertical, 4)
    }
}
