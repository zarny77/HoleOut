//
//  HoleScoringCard.swift
//  HoleOut
//
//  Created by Dylan Zarn on 2024-12-23.
//

import SwiftUI

struct HoleScoringCard: View {
    
    let hole: Hole
//    @ObservedObject var roundVM: RoundViewModel
    
//    private var score: Int {
//        roundVM.currentRound?.scores[hole.id-1] ?? hole.par
//    }
    
    var body: some View {
        GroupBox {
            HStack {
                holeDetails
                Spacer()
                buttonStack
                scoreIndicator
            }
            
        }
        .padding(.horizontal)
    }
    
    // MARK: - Components
    
    private var holeDetails: some View {
        HStack{
        VStack(alignment: .leading) {
                Text(String(hole.id))
                    .font(.system(size: 50))
                    .fontWeight(.black)
                    .padding(.vertical, -5)
            YardageMarkers(b: hole.blues, w: hole.whites, r: hole.reds)
            }
            Spacer()
            Image(systemName: hole.holeType.rawValue)
                .font(.largeTitle)
            Spacer()
        }
    }
    
    private var scoreIndicator: some View {
        VStack (alignment: .trailing, spacing: -20){
            
            HStack {

                VStack(alignment: .trailing) {
                    RelativeScore(par: hole.par, score: 5)
                        .font(.title)
                }
            }
            Text(String(hole.par))
                .font(.system(size: 100, weight: .black))
        }
        .padding(.horizontal)
    }
    
    // MARK: Buttons
    private var buttonStack: some View {
        VStack {
            Spacer()
            addStroke
            Spacer()
            subtractStroke
            Spacer()
        }
    }
    
    private var subtractStroke: some View {
        Button {
            
        } label: {
            Label("Subtract", systemImage: "minus.circle.fill")
                .labelStyle(.iconOnly)
                .font(.largeTitle)
        }
    }
    
    private var addStroke: some View {
        Button {
            
        } label: {
            Label("Add", systemImage: "plus.circle.fill")
                .labelStyle(.iconOnly)
                .font(.largeTitle)
        }
    }
}

#Preview {
    ScrollView {
        ForEach(MockData.previewCourse.holes) { hole in
            HoleScoringCard(hole: hole)
        }
    }
        
}
