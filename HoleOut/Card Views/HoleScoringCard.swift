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
            }
            
        }
        .padding(.horizontal)
    }
    
    private var holeDetails: some View {
        VStack {
            Text(String(hole.id))
                .font(.largeTitle)
                .fontWeight(.black)
            YardageMarkers(b: hole.blues, w: hole.whites, r: hole.reds)
        }
    }
    
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
        HoleScoringCard(hole: MockData.previewCourse.holes[0] )
}
