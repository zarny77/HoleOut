//
//  Hole.swift
//  HoleOut
//
//  Created by Dylan Zarn on 2024-12-20.
//

import Foundation
import SwiftData

enum HoleType: String, Codable {
    case straight = "arrowshape.up.fill"
    case dogLeft = "arrowshape.turn.up.left.fill"
    case dogRight = "arrowshape.turn.up.right.fill"
}

@Model
final class Hole {
    
    var id: Int
    var par: Int
    var blues: Int
    var whites: Int
    var reds: Int
    var holeType: HoleType
    init(id: Int, par: Int, blues: Int, whites: Int, reds: Int, holeType: HoleType = .straight) {
        self.id = id
        self.par = par
        self.blues = blues
        self.whites = whites
        self.reds = reds
        self.holeType = holeType
    }
}
