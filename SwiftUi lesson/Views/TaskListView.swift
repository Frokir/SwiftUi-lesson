//
//  TaskListView.swift
//  SwiftUi lesson
//
//  Created by Олег Переплётчиков on 07.08.2025.
//

import SwiftUI

struct TaskListView: View {
    @StateObject private var viewModel = TaskViewModel()
    @State private var showEditor = false
    @State private var taskToEdit: TaskItem?
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.tasks) { task in
                    TaskRowView(task: task) {
                        viewModel.toggleCompletion(for: task)
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        taskToEdit = task
                        showEditor = true
                    }
                }
                .onDelete(perform: viewModel.deleteTask)
            }
            .navigationTitle("Мои задачи")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        taskToEdit = nil
                        showEditor = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showEditor) {
                TaskEditorView(viewModel: viewModel, task: taskToEdit)
            }
        }
    }
}

#Preview {
    TaskListView()
}
