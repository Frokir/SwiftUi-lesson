//
//  TaskListView.swift
//  SwiftUi lesson
//
//  Created by Олег Переплётчиков on 07.08.2025.
//

import SwiftUI

struct TaskListView: View {
    @StateObject private var viewModel = TaskViewModel()
    @State private var newTaskTitle: String = ""
    @State private var taskToEdit: TaskItem?
    
    var body: some View {
        NavigationStack {
            VStack {
                // Поле для ввода + кнопка
                HStack {
                    TextField("Новая задача", text: $newTaskTitle)
                        .textFieldStyle(.roundedBorder)
                    
                    Button(action: {
                        viewModel.addTask(title: newTaskTitle)
                        newTaskTitle = ""
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                            .foregroundColor(.green)
                    }
                }
                .padding()
                
                // Список задач
                List {
                    ForEach(viewModel.tasks) { task in
                        TaskRowView(task: task) {
                            viewModel.toggleTaskCompletion(task)
                            
                        }
                        .onTapGesture {
                            taskToEdit = task
                        }
                    }
                    

                    .onDelete(perform: viewModel.deleteTask)
                }
                .sheet(item: $taskToEdit) { task in
                    EditTaskView(viewModel: viewModel, task: task)
                }
                .scrollContentBackground(.hidden)
                .background(Color(.systemBackground))
            }
            .navigationTitle("Мои задачи")
            
        }
    }
}
#Preview {
    TaskListView()
}
