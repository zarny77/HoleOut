//
//  ContentView.swift
//  HoleOut
//
//  Created by Dylan Zarn on 2024-12-20.
//

import SwiftUI
import SwiftData

struct CourseSelectView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Round]

    var body: some View {
        Text("CourseSelectView")
    }
}

#Preview {
    CourseSelectView()
        .modelContainer(for: Round.self, inMemory: true)
}
