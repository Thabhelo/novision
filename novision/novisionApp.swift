//
//  novisionApp.swift
//  novision
//
//  Created by Thabhelo Duve on 6/16/24.
//

import SwiftUI
import SwiftData

@main
struct novisionApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [TodoList.self])
    }
}
