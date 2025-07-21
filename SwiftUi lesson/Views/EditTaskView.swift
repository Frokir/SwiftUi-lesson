//
//  EditTaskView.swift
//  SwiftUi lesson
//
//  Created by Олег Переплётчиков on 08.08.2025.
//
import SwiftUI

struct EditTaskView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: TaskViewModel
    var task: TaskItem

    @State private var title: String = ""

    var body: some View {
        NavigationStack {
            Form {
                TextField("Название задачи", text: $title)
            }
            .navigationTitle("Редактировать")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Сохранить") {
                        viewModel.updateTask(task, with: title)
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Отмена") {
                        dismiss()
                    }
                }
            }
        }
        .onAppear {
            title = task.title
        }
    }
}
