//
//  ToDoApp.swift
//  ToDo
//
//  Created by Іван Джулинський on 07.05.2024.
//

import SwiftUI
import SwiftData

@main
struct ToDoApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            ToDo.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            ToDoListView()
        }
        .modelContainer(sharedModelContainer)
    }
}
