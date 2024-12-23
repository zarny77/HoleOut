//
//  RoundCardView.swift
//  HoleOut
//
//  Created by Dylan Zarn on 2024-12-22.
//

import SwiftUI

struct RoundCardView: View {
    
    private let round: Round
    private let course: Course
    private let amended: Bool
    
    private let logger = Logger(origin: "RoundCardView")
    
    init(for round: Round, amended: Bool) {
        self.round = round
        self.course = round.course
        self.amended = amended
    }
    
    // MARK: - Body
    var body: some View {
        GroupBox {
            headerSection
            Divider()
            statSection
            
        }
        .padding(.horizontal)
        
    }
    
    // MARK: - Components
    
    // Shows course name as title if not amended
    // Only shows date if amended
    private var headerSection: some View {
        HStack {
            VStack(alignment: .leading) {
                if !amended {
                    Label(course.name, systemImage: "flag.fill")
                        .font(.headline)
                        .bold()
                }
                if !amended {
                    Label(round.dateString, systemImage: "calendar")
                        .foregroundStyle(.secondary)
                } else {
                    Label(round.dateString, systemImage: "calendar")
                        .font(.headline)
                        .bold()
                }
                if let roundDuration = round.roundDuration {
                    Label(roundDuration, systemImage: "clock")
                        .foregroundStyle(.secondary)
                }
            }
            Spacer()
            RelativeScore(par: course.par, score: round.totalScore)
                .font(.title)
        }
        
    }
    // Shows the scores for the round
    private var statSection: some View {
        HStack {
            StatItem(label: "Total", value: round.totalScore)
            Spacer()
            StatItem(label: "Front", value: round.frontNine)
            Spacer()
            StatItem(label: "Back", value: round.backNine)
        }
    }
}

#Preview {
    RoundCardView(for: MockData.previewRound, amended: false)
    RoundCardView(for: MockData.previewRound, amended: true)
}
