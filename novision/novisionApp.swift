//
//  novisionApp.swift
//  novision
//
//  Created by Thabhelo Duve on 6/16/24.
//

import SwiftUI
import SwiftData
import CoreData

@main
struct novisionApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .modelContainer(for: [Passenger.self])
    }
}

