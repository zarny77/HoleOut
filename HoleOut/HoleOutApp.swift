//
//  HoleOutApp.swift
//  HoleOut
//
//  Created by Dylan Zarn on 2024-12-20.
//

import SwiftUI
import SwiftData

@main
struct HoleOutApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Round.self,
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
            CourseSelectView()
        }
        .modelContainer(sharedModelContainer)
    }
}
