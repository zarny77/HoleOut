//
//  ContentView.swift
//  HoleOut
//
//  Created by Dylan Zarn on 2024-12-20.
//

import SwiftUI

struct CourseSelectView: View {
    
    @State private var searchText = ""
    private let logger = Logger(origin: "CourseSelectView")
    
    // allow search by name or address
    private var searchResults: [Course] {
        if searchText.isEmpty {
            return CourseRepository.shared.getAllCourses()
        }
        return CourseRepository.shared.courses.filter { course in
            course.name.localizedCaseInsensitiveContains(searchText) ||
            course.address.localizedCaseInsensitiveContains(searchText)
        }
    }

    var body: some View {
        NavigationStack {
            Group {
                if searchResults.isEmpty {
                    VStack {
                        Spacer()
                        ContentUnavailableView(
                            "No courses matching \(searchText)",
                            systemImage: "flag.slash",
                            description: Text("Try a different course maybe?")
                        )
                        Spacer()
                    }
                } else {
                    ScrollView {
                        LazyVStack {
                            ForEach(searchResults) { course in
                                CourseCardView(for: course)
                            }
                        }
                    }
                    
                }
            }
            .navigationTitle("Select Course")
            .searchable(text: $searchText, prompt: "Search courses")
        }
    }

}

#Preview {
    CourseSelectView()
        .modelContainer(for: Round.self, inMemory: true)
}
