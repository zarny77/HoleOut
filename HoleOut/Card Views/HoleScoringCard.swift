//
//  HoleScoringCard.swift
//  HoleOut
//
//  Created by Dylan Zarn on 2024-12-23.
//

import SwiftUI

struct HoleScoringCard: View {
    @EnvironmentObject private var roundVM: RoundViewModel
    let hole: Hole
    @Binding var score: Int
    private let logger = Logger(origin: "HoleScoringView")
    
    var body: some View {
        GroupBox {
            HStack {
                holeDetails
                Spacer()
                buttonStack
                scoreIndicator
            }
            .frame(height: 110)
        }
    }
    
    // MARK: - Components
    
    private var holeDetails: some View {
        HStack{
            VStack(alignment: .leading) {
                // Hole number
                Text(String(hole.id))
                    .font(.system(size: 50))
                    .fontWeight(.black)
                    .padding(.vertical, -5)
                // yardages
                YardageMarkers(b: hole.blues, w: hole.whites, r: hole.reds)
            }
            Spacer()
            Image(systemName: hole.holeType.rawValue)
                .font(.largeTitle)
            Spacer()
        }
    }
    
    private var scoreIndicator: some View {
        
        VStack (alignment: .trailing, spacing: -10){
            Spacer()
            RelativeScore(par: hole.par, score: score)
                .font(.title)
                .frame(width: 50, alignment: .trailing)
                .contentTransition(.interpolate)
                .animation(.spring(response: 0.3), value: score)
            ZStack(alignment: .trailing) {
                Text(String(score))
                    .font(.system(size: 100, weight: .black))
                    .minimumScaleFactor(0.1)
                    .lineLimit(1)
                    .fixedSize(horizontal: false, vertical: true)
                    .contentTransition(.numericText())
                    .animation(.spring(response: 0.1), value: score)
                    .onTapGesture {
                        if !(roundVM.currentRound?.playedHoles[hole.id - 1] ?? true) {
                            score = hole.par
                        }
                    }
            }
            .frame(width: 75, height: 100)
        }
        .frame(width: 75)
        .padding(.leading)
    }
    
    // MARK: Buttons
    private var buttonStack: some View {
        VStack {
            addStroke
            Spacer()
            subtractStroke
        }
    }
    
    private var subtractStroke: some View {
        Button {
            if score > 1 {
                score -= 1
                logger.log("Decreased score on hole \(hole.id) to \(score)")
            }
        } label: {
            Label("Subtract", systemImage: "minus.circle.fill")
                .labelStyle(.iconOnly)
                .font(.system(size: 50))
        }
        .symbolRenderingMode(.hierarchical)
        .foregroundStyle(.green)
    }
    
    private var addStroke: some View {
        Button {
            if score < 15 {
                score += 1
                logger.log("Increased score on hole \(hole.id) to \(score)")
            }
        } label: {
            Label("Add", systemImage: "plus.circle.fill")
                .labelStyle(.iconOnly)
                .font(.system(size: 50))
        }
        .symbolRenderingMode(.hierarchical)
        .foregroundStyle(.red)
    }
}

#Preview {
    ScrollView {
        ForEach(MockData.previewCourse.holes) { hole in
            let score = State(initialValue: hole.par)
            HoleScoringCard(hole: hole, score: score.projectedValue)
        }
    }
        
}
