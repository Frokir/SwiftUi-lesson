//
//  TaskViewModel.swift
//  SwiftUi lesson
//
//  Created by Олег Переплётчиков on 07.08.2025.
//

import Foundation

final class TaskViewModel: ObservableObject {
    @Published var tasks: [TaskItem] = [] {
        didSet { saveTasks() }
    }

    private let tasksKey = "tasksKey"

    init() {
        loadTasks()
    }

    // MARK: - Intentions

    func addTask(title: String, note: String) {
        let trimmedTitle = title.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedTitle.isEmpty else { return }
        let newTask = TaskItem(title: trimmedTitle, note: note)
        tasks.append(newTask)
    }

    func update(task: TaskItem, title: String, note: String) {
        guard let index = tasks.firstIndex(where: { $0.id == task.id }) else { return }
        tasks[index].title = title
        tasks[index].note = note
    }

    func toggleCompletion(for task: TaskItem) {
        guard let index = tasks.firstIndex(where: { $0.id == task.id }) else { return }
        tasks[index].isCompleted.toggle()
    }

    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }

    // MARK: - Persistence

    private func saveTasks() {
        do {
            let data = try JSONEncoder().encode(tasks)
            UserDefaults.standard.set(data, forKey: tasksKey)
        } catch {
            print("Ошибка сохранения задач: \(error)")
        }
    }

    private func loadTasks() {
        guard let data = UserDefaults.standard.data(forKey: tasksKey) else { return }
        do {
            tasks = try JSONDecoder().decode([TaskItem].self, from: data)
        } catch {
            print("Ошибка загрузки задач: \(error)")
        }
    }
}

