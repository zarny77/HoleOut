//
//  HoleModel.swift
//  HoleOut
//
//  Created by Dylan Zarn on 2024-12-20.
//

import Foundation
import SwiftData

@Model
final class Hole {
    
    var id: Int
    var par: Int
    var blues: Int
    var whites: Int
    var reds: Int
    
    init(id: Int, par: Int, blues: Int, whites: Int, reds: Int) {
        self.id = id
        self.par = par
        self.blues = blues
        self.whites = whites
        self.reds = reds
    }
}
