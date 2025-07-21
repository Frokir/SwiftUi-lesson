//
//  CustomButton.swift
//  SwiftUi lesson
//
//  Created by Олег Переплётчиков on 08.08.2025.
//
import SwiftUI

struct Custom: View {
    @State private var selectedTab = 0
        @State private var selectedFilter = "Все"

        let tabs = ["Все", "Избранное", "Архив"]
        let filters = ["Все", "Сегодня", "На этой неделе"]

        var body: some View {
            VStack {
                // Табы
                Picker("Выберите вкладку", selection: $selectedTab) {
                    ForEach(0..<tabs.count, id: \.self) { index in
                        Text(tabs[index]).tag(index)
                    }
                }
                .padding()
                .pickerStyle(.segmented)

                // Фильтры
                Picker("Фильтр", selection: $selectedFilter) {
                    ForEach(filters, id: \.self) { filter in
                        Text(filter).tag(filter)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)

                // Контент
                List(filteredData(), id: \.self) { item in
                    Text(item)
                }
                .scrollContentBackground(.hidden)
                //.shadow(radius: 5, x: 0, y: 2)
                .listStyle(.grouped)
                //.listRowSeparator(.hidden)
                
            }
            
        }

        func filteredData() -> [String] {
            var data = mockData[selectedTab]
            if selectedFilter != "Все" {
                data = data.filter { $0.contains(selectedFilter) }
            }
            return data
        }

        let mockData: [[String]] = [
            ["Задача Сегодня", "Задача На этой неделе", "Другое"],
            ["Избранное Сегодня", "Избранное На этой неделе"],
            ["Архив Сегодня", "Архив На этой неделе"]
        ]
}



#Preview {
    Custom()
}
