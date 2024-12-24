//
//  ContentView.swift
//  HoleOut
//
//  Created by Dylan Zarn on 2024-12-20.
//

import SwiftUI

struct CourseSelectView: View {
    
    @State private var searchText = ""
    @EnvironmentObject private var roundVM: RoundViewModel
    private let logger = Logger(origin: "CourseSelectView")
    
    // allow search by name or address
    // contains all courses if no search is entered
    private var searchResults: [Course] {
        if searchText.isEmpty {
            return CourseRepository.shared.getAllCourses()
        }
        return CourseRepository.shared.getAllCourses().filter { course in
            course.name.localizedCaseInsensitiveContains(searchText) ||
            course.address.localizedCaseInsensitiveContains(searchText)
        }
    }

    // If search results are empty, shows ContentUnavailable.
    // If no search is entered, show all courses
    var body: some View {
        NavigationStack {
            Group {
                if searchResults.isEmpty {
                    VStack {
                        Spacer()
                        ContentUnavailableView(
                            "No courses matching \(searchText)",
                            systemImage: "flag.slash",
                            description: Text("Try searching for a different course")
                        )
                        Spacer()
                    }
                } else {
                    ScrollView {
                        VStack {
                            ForEach(searchResults) { course in
                                CourseCard(for: course)
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
