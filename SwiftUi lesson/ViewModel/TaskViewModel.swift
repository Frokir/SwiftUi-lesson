//
//  TaskViewModel.swift
//  SwiftUi lesson
//
//  Created by Олег Переплётчиков on 07.08.2025.
//

import Foundation

class TaskViewModel: ObservableObject {
    @Published var tasks: [TaskItem] = [] {
            didSet {
                saveTasks()
            }
        }

        private let tasksKey = "tasksKey"

        init() {
            loadTasks()
        }
    
    // Добавить задачу
    func addTask(title: String) {
        guard !title.isEmpty else { return }
        let newTask = TaskItem(title: title, isCompleted: false)
        tasks.append(newTask)
    }
    
    // Переключить статус выполнения
    func toggleTaskCompletion(_ task: TaskItem) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
    }
    
    // Удалить задачу
    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
    
    // Редактировать задачу
    func updateTask(_ task: TaskItem, with newTitle: String) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].title = newTitle
        }
    }
    
    private func saveTasks() {
            do {
                let encoder = JSONEncoder()
                let data = try encoder.encode(tasks)
                UserDefaults.standard.set(data, forKey: tasksKey)
            } catch {
                print("Ошибка сохранения задач: \(error)")
            }
        }
        
        private func loadTasks() {
            guard let data = UserDefaults.standard.data(forKey: tasksKey) else { return }
            do {
                let decoder = JSONDecoder()
                tasks = try decoder.decode([TaskItem].self, from: data)
            } catch {
                print("Ошибка загрузки задач: \(error)")
            }
        }
    
    
}
