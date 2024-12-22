//
//  MockData.swift
//  HoleOut
//
//  Created by Dylan Zarn on 2024-12-22.
//

import Foundation

enum MockData {
    static let rounds: [Round] = {
        // Create mock rounds
        let round1 = Round(at: CourseRepository.shared.courses[0])
        round1.scores = [4, 5, 4, 5, 3, 4, 4, 5, 5, 5, 5, 3, 6, 3, 4, 4, 6, 3]
        round1.playedHoles = Array(repeating: true, count: 18)
        round1.holesPlayed = 18
        round1.startTime = Calendar.current.date(byAdding: .hour, value: -4, to: Date())
        round1.endTime = Date()
        
        let round2 = Round(at: CourseRepository.shared.courses[1]) // Southside
        round2.scores = [5, 3, 4, 5, 4, 3, 3, 5, 3]
        round2.playedHoles = Array(repeating: true, count: 9) + Array(repeating: false, count: 9)
        round2.holesPlayed = 9
        round2.startTime = Calendar.current.date(byAdding: .day, value: -2, to: Date())
        round2.endTime = Calendar.current.date(byAdding: .hour, value: 2, to: round2.startTime!)
        
        let round3 = Round(at: CourseRepository.shared.courses[2]) // Maplewood
        round3.scores = [4, 5, 4, 6, 3, 5, 3, 4, 5, 6, 4, 5, 3, 5, 6, 4, 5, 3]
        round3.playedHoles = Array(repeating: true, count: 18)
        round3.holesPlayed = 18
        round3.startTime = Calendar.current.date(byAdding: .day, value: -5, to: Date())
        round3.endTime = Calendar.current.date(byAdding: .hour, value: 4, to: round3.startTime!)
        
        return [round1, round2, round3]
    }()
    
    static var previewRound: Round {
        rounds[0]
    }
    
    static var partialRound: Round {
        rounds[1]
    }
    
    static var previewCourse: Course {
        CourseRepository.shared.courses[0]
    }
}
