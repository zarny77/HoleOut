//
//  CourseRepository.swift
//  HoleOut
//
//  Created by Dylan Zarn on 2024-11-03.
//

import Foundation

class CourseRepository {
    
    static let shared = CourseRepository()
    
    private init() {}
    
    let courses: [Course] = [
        .stBoniface,
        .southside,
        .maplewood
    ]
    
}
    
private extension Course {
    
    // St. Boniface Golf Course
    static var stBoniface: Course {
        Course(
            name: "St. Boniface GC",
            address: "100 Rue Youville, Winnipeg, MB",
            blues: 6348,
            whites: 6104,
            reds: 5719,
            par: 72,
            holes: [
                Hole(id: 1, par: 4, blues: 357, whites: 340, reds: 320),
                Hole(id: 2, par: 4, blues: 365, whites: 255, reds: 292),
                Hole(id: 3, par: 4, blues: 379, whites: 368, reds: 320),
                Hole(id: 4, par: 4, blues: 379, whites: 361, reds: 346),
                Hole(id: 5, par: 3, blues: 163, whites: 145, reds: 127),
                Hole(id: 6, par: 4, blues: 332, whites: 326, reds: 317),
                Hole(id: 7, par: 4, blues: 282, whites: 271, reds: 256),
                Hole(id: 8, par: 4, blues: 366, whites: 355, reds: 339),
                Hole(id: 9, par: 5, blues: 520, whites: 497, reds: 444),
                Hole(id: 10, par: 4, blues: 441, whites: 430, reds: 418),
                Hole(id: 11, par: 4, blues: 483, whites: 471, reds: 461),
                Hole(id: 12, par: 3, blues: 220, whites: 206, reds: 223),
                Hole(id: 13, par: 5, blues: 516, whites: 496, reds: 476),
                Hole(id: 14, par: 3, blues: 205, whites: 185, reds: 165),
                Hole(id: 15, par: 4, blues: 330, whites: 316, reds: 301),
                Hole(id: 16, par: 4, blues: 325, whites: 319, reds: 325),
                Hole(id: 17, par: 5, blues: 516, whites: 504, reds: 448),
                Hole(id: 18, par: 3, blues: 169, whites: 159, reds: 154)
            ]
        )
    }
    
    // Southside Golf Course
    static var southside: Course {
        Course(
            name: "Southside Golf Course",
            address: "2226 Southside Road, Grande Pointe, MB",
            blues: 4696,
            whites: 4190,
            reds: 3806,
            par: 63,
            holes: [
                Hole(id: 1, par: 4, blues: 408, whites: 376, reds: 352),
                Hole(id: 2, par: 3, blues: 113, whites: 102, reds: 90),
                Hole(id: 3, par: 3, blues: 199, whites: 170, reds: 158),
                Hole(id: 4, par: 4, blues: 390, whites: 347, reds: 336),
                Hole(id: 5, par: 4, blues: 332, whites: 296, reds: 282),
                Hole(id: 6, par: 3, blues: 170, whites: 145, reds: 134),
                Hole(id: 7, par: 3, blues: 142, whites: 124, reds: 105),
                Hole(id: 8, par: 4, blues: 350, whites: 312, reds: 286),
                Hole(id: 9, par: 3, blues: 130, whites: 104, reds: 100),
                Hole(id: 10, par: 4, blues: 376, whites: 353, reds: 293),
                Hole(id: 11, par: 3, blues: 173, whites: 150, reds: 141),
                Hole(id: 12, par: 3, blues: 138, whites: 115, reds: 100),
                Hole(id: 13, par: 4, blues: 341, whites: 326, reds: 319),
                Hole(id: 14, par: 3, blues: 166, whites: 142, reds: 120),
                Hole(id: 15, par: 3, blues: 132, whites: 110, reds: 88),
                Hole(id: 16, par: 4, blues: 383, whites: 345, reds: 324),
                Hole(id: 17, par: 5, blues: 536, whites: 486, reds: 442),
                Hole(id: 18, par: 3, blues: 217, whites: 187, reds: 156)
            ]
        )
    }
    
    // Maplewood Golf Club
    static var maplewood: Course {
        Course(
            name: "Maplewood Golf Club",
            address: "19113 Cure Road, St-Pierre-Jolys, MB",
            blues: 5731,
            whites: 5330,
            reds: 4533,
            par: 70,
            holes: [
                Hole(id: 1, par: 4, blues: 350, whites: 339, reds: 315),
                Hole(id: 2, par: 4, blues: 309, whites: 300, reds: 280),
                Hole(id: 3, par: 4, blues: 309, whites: 300, reds: 284),
                Hole(id: 4, par: 5, blues: 295, whites: 262, reds: 249),
                Hole(id: 5, par: 3, blues: 175, whites: 154, reds: 135),
                Hole(id: 6, par: 4, blues: 385, whites: 370, reds: 270),
                Hole(id: 7, par: 3, blues: 161, whites: 145, reds: 128),
                Hole(id: 8, par: 4, blues: 325, whites: 302, reds: 247),
                Hole(id: 9, par: 4, blues: 388, whites: 348, reds: 303),
                Hole(id: 10, par: 5, blues: 469, whites: 444, reds: 399),
                Hole(id: 11, par: 4, blues: 300, whites: 280, reds: 164),
                Hole(id: 12, par: 4, blues: 414, whites: 379, reds: 315),
                Hole(id: 13, par: 3, blues: 220, whites: 175, reds: 125),
                Hole(id: 14, par: 4, blues: 347, whites: 327, reds: 257),
                Hole(id: 15, par: 5, blues: 449, whites: 434, reds: 399),
                Hole(id: 16, par: 4, blues: 292, whites: 282, reds: 234),
                Hole(id: 17, par: 4, blues: 379, whites: 339, reds: 304),
                Hole(id: 18, par: 3, blues: 164, whites: 150, reds: 125)]
        )
    }
}
