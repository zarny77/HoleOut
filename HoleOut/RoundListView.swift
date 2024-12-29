//
//  RoundListView.swift
//  HoleOut
//
//  Created by Dylan Zarn on 2024-12-29.
//

import SwiftUI
import SwiftData

struct RoundListView: View {
    
    @Query(sort: \Round.date, order: .reverse) private var rounds: [Round]
    @State private var searchText = ""
    @EnvironmentObject private var roundVM: RoundViewModel
    private let logger = Logger(origin: "RoundListView")
    
    // allow search by course or date
    private var searchResults: [Round] {
        if searchText.isEmpty {
            return rounds
        }
        return rounds.filter { round in
            round.course.name.localizedCaseInsensitiveContains(searchText) ||
            round.dateString.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    var body: some View {
        NavigationStack {
            Group {
                if searchResults.isEmpty {
                    VStack {
                        Spacer()
                        ContentUnavailableView(
                            "No rounds matching \(searchText)",
                            systemImage: "flag.slash",
                            description: Text("Try a different search or play more rounds")
                        )
                        Spacer()
                    }
                } else {
                    ScrollView {
                        ForEach(searchResults) { round in
                            RoundCard(for: round, amended: false)
                                .swipeActions {
                                    Button(role: .destructive) {
                                        roundVM.deleteRound(round)
                                    } label: {
                                        Label("Delete", systemImage: "trash")
                                    }
                                }
                        }
                    }
                }
            }
            .navigationTitle("Past Rounds")
            .searchable(text: $searchText, prompt: "Search Rounds")
            
        }
    }
}

#Preview {
    @MainActor in
    RoundListView()
        .modelContainer(MockData.container)
        .environmentObject(RoundViewModel.preview)
}
