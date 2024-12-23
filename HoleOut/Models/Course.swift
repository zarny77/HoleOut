//
//  Course.swift
//  HoleOut
//
//  Created by Dylan Zarn on 2024-12-20.
//

import Foundation
import SwiftData

@Model
final class Course {
    // MARK: Properties
    
    // Identifiers
    var id: UUID
    var name: String
    var address: String
    
    // Details
    var blues: Int
    var whites: Int
    var reds: Int
    var par: Int
    var holes: [Hole]
    
    init(name: String, address: String, blues: Int, whites: Int, reds: Int, par: Int, holes: [Hole]) {
        self.id = UUID()
        self.name = name
        self.address = address
        self.blues = blues
        self.whites = whites
        self.reds = reds
        self.par = par
        self.holes = holes.sorted { $0.id < $1.id }
    }
    
    // MARK: - Computed Properties
    
    var totalBlues: Int {
        holes.reduce(0) { $0 + $1.blues }
    }
 
    var totalWhites: Int {
        holes.reduce(0) { $0 + $1.whites }
    }
    
    var totalReds: Int {
        holes.reduce(0) { $0 + $1.reds }
    }
    
    // Course yardage totals front 9
    
    var frontBlues: Int {
        holes.prefix(9).reduce(0) { $0 + $1.blues }
    }
    
    var frontWhites: Int {
        holes.prefix(9).reduce(0) { $0 + $1.whites }
    }
    
    var frontReds: Int {
        holes.prefix(9).reduce(0) { $0 + $1.reds }
    }
    
    // Course yardage totals back 9
    
    var backBlues: Int {
        holes.suffix(9).reduce(0) { $0 + $1.blues }
    }
    
    var backWhites: Int {
        holes.suffix(9).reduce(0) { $0 + $1.whites }
    }
    
    var backReds: Int {
        holes.suffix(9).reduce(0) { $0 + $1.reds }
    }
    
    // Par totals
    
    var frontPar: Int {
        holes.prefix(9).reduce(0) { $0 + $1.par }
    }
    
    var backPar: Int {
        holes.suffix(9).reduce(0) { $0 + $1.par }
    }
}
