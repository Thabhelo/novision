//
//  ContentView.swift
//  novision
//
//  Created by Thabhelo Duve on 6/16/24.
//

import SwiftUI
import RealityKit
import RealityKitContent
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    
    @Query private var todoLists: [TodoList] = []
    @State private var selectedTodoList: TodoList? = nil
    
    @State private var showAddListAlert: Bool = false
    @State private var newListTitle: String = ""

    var body: some View {
        NavigationSplitView {
            List(todoLists) { list in
                Button(action: {
                    selectedTodoList = list
                }) {
                    Text(list.title)
                }
            }
            .navigationTitle("Todo Lists")
            .toolbar {
                Button("Add") {
                    showAddListAlert.toggle()
                }
            }
            .alert("Add Todo List", isPresented: $showAddListAlert){
                TextField("Todo List Title", text: $newListTitle)
                Button("Cancel", role: .cancel, action: {})
                Button("Create"){
                    let list = TodoList(title: "\(newListTitle)")
                    modelContext.insert(list)
                }
            }
        } detail: {
            if let selectedTodoList {
                VStack {
                    Text(selectedTodoList.title)
                        .font(.largeTitle)
                        .padding()
                    TodoListView(list: selectedTodoList)
                    List(selectedTodoList.items) { item in
                        HStack {
                            Text(item.title)
                            Spacer()
                            if item.isDone {
                                Image(systemName: "checkmark")
                                    .foregroundColor(.green)
                            }
                        }
                    }
                }
                .navigationTitle("Details for \(selectedTodoList.title)")
            } else {
                Text("Select a list")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}

