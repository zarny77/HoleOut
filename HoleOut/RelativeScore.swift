//
//  RelativeScore.swift
//  HoleOut
//
//  Created by Dylan Zarn on 2024-12-22.
//

import SwiftUI

struct RelativeScore: View {
    private let par: Int
    private let score: Int
    
    init(par: Int, score: Int) {
        self.par = par
        self.score = score
    }
    
    var body: some View {
        let relative = score - par
        
        switch relative {
        case 0:
            Text("E")
                .foregroundStyle(.blue)
        case 1...9:
            Text("+\(relative)")
                .foregroundStyle(.orange)
        case let score where score > 9:
            Text("+\(relative)")
                .foregroundStyle(.red)
        case let score:
            Text("\(relative)")
                .foregroundStyle(.green)
            
        }
    }
}

#Preview {
    RelativeScore(par: 3, score: 2)
    RelativeScore(par: 5, score: 5)
    RelativeScore(par: 5, score: 7)
    RelativeScore(par: 5, score: 16)
}
