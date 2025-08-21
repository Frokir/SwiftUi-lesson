//
//  TaskEditorView.swift
//  SwiftUi lesson
//
//  Created by Олег Переплётчиков on 08.08.2025.
//

import SwiftUI

struct TaskEditorView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: TaskViewModel
    var task: TaskItem?

    @State private var title: String = ""
    @State private var note: String = ""

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Название")) {
                    TextField("Введите название", text: $title)
                }

                Section(header: Text("Заметка")) {
                    TextEditor(text: $note)
                        .frame(minHeight: 100)
                }
            }
            .navigationTitle(task == nil ? "Новая задача" : "Редактирование")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Сохранить") {
                        if let task { viewModel.update(task: task, title: title, note: note) }
                        else { viewModel.addTask(title: title, note: note) }
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Отмена") { dismiss() }
                }
            }
        }
        .onAppear {
            if let task {
                title = task.title
                note = task.note
            }
        }
    }
}

