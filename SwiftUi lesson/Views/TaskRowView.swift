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
        HStack {
            Button(action: toggleCompletion) {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(task.isCompleted ? .green : .gray)
                    .imageScale(.large)
            }
            .buttonStyle(.plain) // убирает стандартную анимацию кнопки
            
            Text(task.title)
                .strikethrough(task.isCompleted)
                .foregroundColor(task.isCompleted ? .gray : .primary)
                .animation(.easeInOut, value: task.isCompleted)
            
            Spacer()
        }
        //.padding(.vertical, 4)
    }
}
