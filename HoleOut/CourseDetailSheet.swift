//
//  CourseDetailSheet.swift
//  HoleOut
//
//  Created by Dylan Zarn on 2024-12-22.
//

import SwiftUI
import SwiftData

struct CourseDetailSheet: View {
    private let course: Course
    @Query private var rounds: [Round]
    @Environment(\.modelContext) private var modelContext
    
    private let logger: Logger
    
    init(for course: Course) {
        self.course = course
        
        _rounds = Query()
        self.logger = Logger(origin: "CourseDetailSheet: \(course.name)")
    }
    
    var body: some View {
        let courseRounds = rounds.filter { $0.course == course }
            .sorted {$0.date > $1.date }
        
        ScrollView {
            VStack {
                CourseOverviewCard(for: course)
                HStack {
                    Text("Past Rounds")
                        
                    Spacer()
                    Text(String(courseRounds.count))
                }
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)

                if courseRounds.isEmpty {
                    ContentUnavailableView(
                        "No rounds played here",
                        systemImage: "figure.golf.circle",
                        description: Text("Save a round here to see past rounds")
                    )
                } else {
                    ForEach(courseRounds) { round in
                        RoundCardView(for: round, amended: true)
                    }
                }
            }
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Round.self, configurations: config)
    
    container.mainContext.insert(MockData.previewRound)
    return CourseDetailSheet(for: MockData.previewCourse)
        .modelContainer(container)
}
