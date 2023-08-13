//
//  ContentView.swift
//  ToDoApp SwiftData
//
//  Created by YAUHENI LEVIN on 13.08.23.
//
import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var toDoItems: [ToDoItem]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(toDoItems) { item in
                    HStack {
                        Text(item.name)
                        Spacer()
                        if item.isComplete {
                            Image(systemName: "checkmark")
                        }
                    }
                }
                .onDelete(perform: { indexSet in
                    for index in indexSet {
                        let itemToDelete = toDoItems[index]
                        modelContext.delete(itemToDelete)
                    }
                })
            }
            .navigationTitle("ToDoList")
            .toolbar {
                Button("", systemImage: "plus") {
                    withAnimation {
                        modelContext.insert(generateRandomToDoItem())
                    }
                }
            }
        }
    }
    
    func generateRandomToDoItem() -> ToDoItem {
        let tasks = [ "Buy groceries",
                      "Finish homework",
                      "Go for a run",
                      "Practice Yoga",
                      "Read a book",
                      "Write a blog post",
                      "Clean the house",
                      "Walk the dog",
                      "Attend a meeting" ]
        let randomIndex = Int.random(in: 0..<tasks.count)
        let randomTask = tasks[randomIndex]
        return ToDoItem(name: randomTask, isComplete: Bool.random())
    }
}
    
    #Preview {
        ContentView()
            .modelContainer(for: ToDoItem.self)
    }
