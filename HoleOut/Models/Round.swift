//
//  Round.swift
//  HoleOut
//
//  Created by Dylan Zarn on 2024-12-20.
//

import Foundation
import SwiftData

@Model
final class Round {
    
    // MARK: - Default properties
    var id: UUID
    var date: Date
    var holesPlayed: Int
    var startTime: Date?
    var endTime: Date?
    var course: Course
    var scores: [Int]
    var playedHoles: [Bool]

    init(at course: Course) {
        self.id = UUID()
        self.course = course
        self.date = Date()
        self.scores = course.holes.map { $0.par }
        self.playedHoles = Array(repeating: false, count: course.holes.count)
        self.holesPlayed = 0
        self.startTime = Date()
    }
    
    // MARK: - Computed properties
    
    var totalScore: Int {
        zip(scores, playedHoles)
            .filter {_, played in played}
            .map { score, _ in score }
            .reduce(0,+)
    }
    
    var parForPlayedHoles: Int {
        let total = zip(course.holes, playedHoles)
            .filter {_, played in played }
            .map { hole, _ in
                print("Counting par \(hole.par) for hole \(hole.id)")
                return hole.par
            }
            .reduce(0,+)
        print("Total par for played holes: \(total)")
            return total
    }
    
    var frontNine: Int {
        zip(scores.prefix(9), playedHoles.prefix(9))
            .filter { _, played in played }
            .map { score, _ in score }
            .reduce(0,+)
    }
    
    var backNine: Int {
        zip(scores.suffix(9), playedHoles.suffix(9))
            .filter { _, played in played }
            .map { score, _ in score }
            .reduce(0,+)
    }
    
    var isComplete: Bool {
        holesPlayed == course.holes.count
    }
    
    var isPartial: Bool {
        holesPlayed > 0 && !isComplete
    }
    
    private var duration: TimeInterval? {
        startTime.map { (endTime ?? Date()).timeIntervalSince($0) }
    }
    
    var roundDuration: String? {
        duration.map { duration in
            let hours = Int(duration) / 3600
            let minutes = Int(duration) / 60 % 60
            return hours > 0 ? "\(hours)h \(minutes)m" : "\(minutes)m"}
    }
    
    var dateString: String {
        date.formatted(date: .abbreviated, time: .omitted)
    }
    
}
