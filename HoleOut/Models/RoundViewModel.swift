//
//  RoundViewModel.swift
//  HoleOut
//
//  Created by Dylan Zarn on 2024-12-22.
//

import Foundation
import SwiftData

final class RoundViewModel: ObservableObject {
    @Published private(set) var currentRound: Round?
    
    private let logger = Logger(origin: "RoundViewModel")
    
    private let modelContext: ModelContext
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    // MARK: - Round Management
    
    // starts a new round
    func startNewRound(at course: Course) {
        currentRound = Round(at: course)
        logger.log("New round started at \(course.name)", level: .info)
    }
    
    // saves round to modelContainer
    func saveRound() {
        guard let round = currentRound else { return }
        modelContext.insert(round)
        do {
            try modelContext.save()
            logger.log("Saved round", level: .success)
        } catch {
            logger.log("Error saving round: \(error.localizedDescription)", level: .error)
        }
    }
    
    // deletes the round from the model container
    func deleteRound(_ round: Round) {
        if round.id == currentRound?.id {
            currentRound = nil
        }
        modelContext.delete(round)
        
        do {
            try modelContext.save()
            logger.log("Deleted round", level: .success)
        } catch {
            logger.log("Error deleting round: \(error.localizedDescription)", level: .error)
        }
    }
    
    // used to prevent saving new rounds to the model container with no score
    func abandonRound() {
        guard let round = currentRound else { return }
        
        if round.holesPlayed == 0 || !round.isComplete {
            deleteRound(round)
        }
    }
    
    
    func updateScore(for holeIndex: Int, score: Int) {
        guard var round = currentRound,
              holeIndex < round.scores.count else { return }
        
        round.scores[holeIndex] = score
        round.playedHoles[holeIndex] = true
        round.holesPlayed = round.playedHoles.filter { $0 }.count
        
        currentRound = round
        
        logger.log("Updated score to \(score) for hole \(holeIndex)", level: .success)
    }
    
    
    
}
