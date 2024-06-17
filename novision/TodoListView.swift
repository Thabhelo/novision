//
//  TodoListView.swift
//  novision
//
//  Created by Thabhelo Duve on 6/16/24.
//

import SwiftUI
import SwiftData

struct TodoListView: View {
    @Environment(\.modelContext) private var modelContext
    
    @State var list: TodoList
    
    @State private var showAddTodoAlert: Bool = false
    @State private var newTodoTitle: String = ""
    
    var body: some View {
        List {
            Section("Todo") {
                ForEach(list.items.filter{ $0.isDone == false }) { item in
                    HStack {
                        Button {
                            item.isDone.toggle()
                        } label: {
                            Image(systemName: item.isDone ? "circle.fill" : "circle")
                        }
                        Text(item.title)
                        Spacer()
                    }
                }
            }
            
            Section("Done") {
                ForEach(list.items.filter{ $0.isDone }) { item in
                    HStack {
                        Button {
                            item.isDone.toggle()
                        } label: {
                            Image(systemName: item.isDone ? "circle.fill" : "circle")
                        }
                        Text(item.title)
                        Spacer()
                    }
                }
            }
        }
        .navigationTitle("Task List")
        .id(list.id)
        .toolbar {
            Button("Add Task"){
                showAddTodoAlert.toggle()
            }
        }
        .alert("Add task", isPresented: $showAddTodoAlert){
            TextField("Todo List Title", text: $newTodoTitle)
            Button("Cancel", role: .cancel, action: {})
            Button("Create"){
                let todo = TodoItem(title: "\(newTodoTitle)")
                modelContext.insert(todo)
                list.items.append(todo)
                newTodoTitle = ""
            }
        }
    }
}
