/*
//  CourseDetailSheet.swift
//  HoleOut
//
//  Shows the CourseOverviewCard, as well
//  as the past rounds saved at the course
//
//  Created by Dylan Zarn on 2024-12-22.
*/

import SwiftUI
import SwiftData

struct CourseDetailSheet: View {
    
    private let course: Course
    @Query private var rounds: [Round]
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    private let logger: Logger
    
    init(for course: Course) {
        self.course = course
        
        _rounds = Query()
        self.logger = Logger(origin: "CourseDetailSheet: \(course.name)")
    }
    
    var body: some View {
            ScrollView {
                VStack(spacing: 10) {
                    // header
                    courseHeader
                        .padding(.top)
                    // CourseOverview
                    CourseOverviewCard(for: course)
                    // Past rounds title
                    HStack {
                        Text("Past Rounds")
                        Spacer()
                        Text(String(courseRounds.count))
                    }
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                    // Past rounds card stack
                    // if no rounds have been saved here show
                    // ContentUnavailableView
                    if courseRounds.isEmpty {
                        ContentUnavailableView(
                            "No rounds played here",
                            systemImage: "figure.golf.circle",
                            description: Text("Save a round here to see past rounds")
                        )
                    } else {
                        ForEach(courseRounds) { round in
                            RoundCard(for: round, amended: true)
                        }
                    }
                }
            }
            .presentationDetents([.large])
            .presentationDragIndicator(.visible)
    }
    
    // filters for rounds at the given course
    private var courseRounds: [Round] {
        rounds.filter { $0.course == course }
            .sorted { $0.date > $1.date }
    }

    // MARK: - Components
    
    private var courseHeader: some View {
        HStack {
            Text(course.name)
                .font(.largeTitle)
                .fontWeight(.black)
            Spacer()
        }
        .padding(.horizontal)
    }
    
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Round.self, configurations: config)
    
    
    container.mainContext.insert(MockData.previewRound)
    return Color.clear
        .sheet(isPresented: .constant(true)) {
            CourseDetailSheet(for: MockData.previewCourse)
                .modelContainer(container)
        }
}
