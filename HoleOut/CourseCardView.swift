//
//  CourseCardView.swift
//  HoleOut
//
//  Created by Dylan Zarn on 2024-12-22.
//

import SwiftUI

struct CourseCardView: View {
    
    private let course: Course
    private let logger: Logger
    
    init(for course: Course) {
        self.course = course
        self.logger = Logger(origin: "CourseCard: \(course.name)")
    }
    
    var body: some View {
        GroupBox {
            courseDetails
            Divider()
            buttonSet
        }
        .padding(.horizontal)
        .onAppear {
            logger.log("loaded")
        }
    }
    
    
    // MARK: - Components
    
    // Displayes name, address, and par
    private var courseDetails: some View {
        HStack {
            VStack (alignment: .leading) {
                Text(course.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .minimumScaleFactor(0.5)
                Label(course.address, systemImage: "location.fill")
                    .foregroundStyle(.secondary)
                    .font(.subheadline)
                    .minimumScaleFactor(0.5)
            }
            Spacer()
        }
    }
    
    
    // Groups both buttons
    private var buttonSet: some View {
        HStack {
            previewCourseButton
                .frame(maxWidth: .infinity)
            startRoundButton
                .frame(maxWidth: .infinity)
        }
        .frame(maxHeight: 50)
    }
    
    
    private var previewCourseButton: some View {
        Button {
            
        } label: {
            Label("Details", systemImage: "info.circle")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .contentShape(Rectangle())
        }
        .buttonStyle(.borderedProminent)
    }
    
    private var startRoundButton: some View {
        Button {
            
        } label: {
            Label("Start Round", systemImage: "figure.golf")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .contentShape(Rectangle())
        }
        .buttonStyle(.borderedProminent)
    }
}

#Preview {
    CourseCardView(for: MockData.previewCourse)
}
