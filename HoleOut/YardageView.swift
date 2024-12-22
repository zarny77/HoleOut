//
//  YardagesView.swift
//  HoleOut
//
//  Created by Dylan Zarn on 2024-11-01.
//

import SwiftUI

struct YardageView: View {
    
    // store yardages and pin colour
    let yds: Int
    let pin: Color
    
    // add them in an init
    init(_ yds: Int, _ pin: Color) {
        self.yds = yds
        self.pin = pin
    }
    
    var body: some View {
    
        // build circle marker with input colour and yardage
        HStack(spacing: 6) {
            
            Circle()
                .fill(pin)
                .frame(width: 10, height: 10)
            
            Text(String(yds))
                .font(.footnote)
                .foregroundStyle(.primary)
        }
        .frame(width: 50)
        
    }
}

#Preview {
    VStack {
        YardageView(321, .blue)
        YardageView(305, .white)
        YardageView(289, .red)
    }
    .padding()
    .background(Color(.secondarySystemBackground))
}
