//
//  ScorecardView.swift
//  HoleOut
//
//  Created by Dylan Zarn on 2024-12-23.
//

import SwiftUI

struct ScorecardView: View {
    @EnvironmentObject private var roundVM: RoundViewModel
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @Binding var selectedTab: Int
    @State private var showActions = false
    
    private let logger = Logger(origin: "ScorecardView")
    
    var body: some View {
        VStack {
            fullStatusBar
            
            if let round = roundVM.currentRound {
                ScrollView {
                    VStack {
                        ForEach(round.course.holes.indices, id: \.self) { index in
                            HoleScoringCard(
                                hole: round.course.holes[index],
                                score: roundVM.scoreBindings[index]
                            )
                        }
                    }
                }
            }
        }
        .padding(.horizontal)
    }
    
    // MARK: - Components
    
    private var fullStatusBar: some View {
        GroupBox {
            VStack {
                roundStatusBar
                    .onTapGesture {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                            showActions.toggle()
                        }
                    }
                
                if showActions {
                    Divider()
                    actionButtons
                        .transition(.move(edge: .top).combined(with: .opacity))
                }
            }
        }
        .onTapGesture {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                showActions.toggle()
            }
        }
    }
    
    private var roundStatusBar: some View {
        HStack {
            StatItem(
                label: "Total",
                value: roundVM.currentRound?.totalScore ?? 0
            )
            Spacer()
            StatItem(
                label: "Front",
                value: roundVM.currentRound?.frontNine ?? 0)
            Spacer()
            StatItem(
                label: "Back",
                value: roundVM.currentRound?.backNine ?? 0)
        }
    }
    
    private var actionButtons: some View {
        HStack {
            // discard button
            Button {
                logger.log("Discard pressed")
                roundVM.abandonRound()
                dismiss()
            } label: {
                Label("Discard", systemImage: "trash")
                    .padding()
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .tint(Color(.red).opacity(0.5))

            Button {
                logger.log("Save pressed")
                roundVM.saveRound()
                dismiss()
                selectedTab = 1
            } label: {
                Label("Save", systemImage: "square.and.arrow.down")
                    .padding()
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .tint(Color(.green).opacity(0.5))
            
        }
        
    }
}

#Preview {
    ScorecardView(selectedTab: .constant(0))
        .environmentObject(RoundViewModel.preview)
}
