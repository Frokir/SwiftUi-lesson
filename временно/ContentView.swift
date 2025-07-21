import SwiftUI

struct Person: Identifiable {
    let id = UUID()
    let name: String
    let profession: String
    let wearWeFind: String
    let status: String
}

struct FriendView: View {
    let person: Person
    @State private var animate = false
    

    var body: some View {
        VStack{
            VStack(alignment: .leading, spacing: 12) {
                // Имя
                Image(systemName: "rectangle.inset.filled.and.person.filled")
                Text(person.name)
                    .font(.title2)
                    .fontWeight(.bold)
                
                // Профессия
                Text("Профессия: \(person.profession)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                // Место встречи
                Text("Место встречи: \(person.wearWeFind)")
                    .font(.subheadline)
                
                // Статус
                Text("Статус: \(person.status)")
                    .font(.subheadline)
                    .foregroundColor(person.status == "Контакт активен" ? .green : .red)
                
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemBackground)) // белый / тёмный фон в зависимости от темы
                    .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
            )
            .padding()
            .scaleEffect(animate ? 1 : 0.95)
            .opacity(animate ? 1 : 0)
            .animation(.easeOut(duration: 1), value: animate)
            .onAppear {
                animate = true
            }
            .navigationTitle(person.name)
            
            Spacer()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
        
    }
}

struct ContentView: View {
    var myFriendsList: [Person] = [
        Person(name: "Наташа Винник", profession: "Модель", wearWeFind: "Караганда", status: "Контакт потерян"),
        Person(name: "Сергей Мавроди", profession: "Спекулянт", wearWeFind: "Москва", status: "Контакт потерян"),
        Person(name: "Миша Мелвель", profession: "Музыкант", wearWeFind: "Алматы", status: "Контакт активен")
    ]
    
    var body: some View {
        
        ZStack {
            VStack {
                NavigationStack {
                    List(myFriendsList) { friend in
                        NavigationLink(destination: FriendView(person: friend)){
                            HStack(alignment: .top, spacing: 12) {
                                // Например, аватар-заглушка
                                Circle()
                                    .fill(Color.blue.opacity(0.3))
                                    .frame(width: 50, height: 50)
                                    .overlay(Text(String(friend.name.prefix(1)))
                                        .font(.headline)
                                        .foregroundColor(.white))
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(friend.name)
                                        .font(.headline)
                                    Text(friend.profession)
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                    Text("Статус: \(friend.status)")
                                        .font(.caption)
                                        .foregroundColor(friend.status == "Контакт активен" ? .green : .red)
                                }
                            }
                            
                        }
                        
                    }
                    .navigationTitle("Friends")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                                // Действие
                            }) {
                                Image(systemName: "plus")
                            }
                        }
                    }
                    
                    
                }
                
                
            }
            VStack {
                    Spacer()    // отодвигает кнопку вниз
                    HStack {
                        Spacer()    // отодвигает кнопку вправо
                        Button(action: {}) {
                            Image(systemName: "plus")
                                .foregroundColor(Color.white)
                                .font(.largeTitle)
                                .fontWeight(.heavy)
                                .frame(width: 60, height: 60)
                                .background(Color.blue)
                                .cornerRadius(100)
                                .padding([.bottom, .trailing], 40.0) // небольшой отступ от края
                        }
                    }
                }
        }
        
        
    }
        
            
}




#Preview {
    ContentView()
}
