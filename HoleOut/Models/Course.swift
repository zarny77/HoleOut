//
//  CourseModel.swift
//  HoleOut
//
//  Created by Dylan Zarn on 2024-12-20.
//

import Foundation


final class Course {
    // MARK: Properties
    
    var id: UUID
    var name: String
    var address: String
    
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
    
    
}
