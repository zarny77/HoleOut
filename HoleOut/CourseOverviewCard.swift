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
        HStack {
            VStack(alignment: .leading) {
                Text("Course Overview")
                    .font(.headline)
                    .fontWeight(.bold)
                
                Label(course.address, systemImage: "location.fill")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            YardageView(b: course.blues, w: course.whites, r: course.reds)
        }
        
    }
}

#Preview {
    CourseOverviewCard(for: MockData.previewCourse)
}
