//
//  CourseDetailView.swift
//  HoleOut
//
//  Created by Dylan Zarn on 2024-12-22.
//

import SwiftUI

struct CourseOverviewCard: View {
    private let course: Course
    
    private let logger = Logger(origin: "CourseDetailView")
    
    init(for course: Course) {
        self.course = course
    }
    
    var body: some View {
        GroupBox {
            headerSection
        }
        .padding(.horizontal)
    }
    
    // MARK: - Components
    
    private var headerSection: some View {
        VStack {
            HStack {
                courseHeader
                Spacer()
            }
            
            Divider()
            HStack {
                statLine
                Spacer()
                YardageMarkers(b: course.blues, w: course.whites, r: course.reds, markerLeft: false)
            }
        }
    }
    
    private var courseHeader: some View {
        VStack(alignment: .leading) {
            Text("Course Overview")
                .font(.headline)
                .fontWeight(.bold)
            
            Label(course.address, systemImage: "location.fill")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }
    
    private var statLine: some View {
            VStack(alignment: .leading) {
                StatItem(label: "Front", value: course.frontPar)
                StatItem(label: "Back", value: course.backPar)
                StatItem(label: "Total", value: course.par)
            }
    }
}

#Preview {
    CourseOverviewCard(for: MockData.previewCourse)
}
