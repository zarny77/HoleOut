//
//  YardagesView.swift
//  HoleOut
//
//  Created by Dylan Zarn on 2024-11-01.
//

import SwiftUI

struct YardageView: View {
    
    // store yardages and pin colour
    let blues: Int
    let whites: Int
    let reds: Int
    
    // add them in an init
    init(b blues: Int, w whites: Int, r reds: Int) {
        self.blues = blues
        self.whites = whites
        self.reds = reds
    }
    
    var body: some View {
    
        // build circle marker with input colour and yardage
        
        VStack {
            blueMarker
            whiteMarker
            redMarker
        }
        .frame(width: 50)
        
    }
    
    private var blueMarker: some View {
        HStack(spacing: 6) {
            
            Circle()
                .fill(.blue)
                .frame(width: 10, height: 10)
            
            Text(String(blues))
                .font(.footnote)
                .foregroundStyle(.primary)
        }
    }
    
    private var whiteMarker: some View {
        HStack(spacing: 6) {
            
            Circle()
                .fill(.white)
                .frame(width: 10, height: 10)
            
            Text(String(whites))
                .font(.footnote)
                .foregroundStyle(.primary)
        }
    }
    
    private var redMarker: some View {
        HStack(spacing: 6) {
            
            Circle()
                .fill(.red)
                .frame(width: 10, height: 10)
            
            Text(String(reds))
                .font(.footnote)
                .foregroundStyle(.primary)
        }
    }
}

#Preview {
    VStack {
        YardageView(b: 321, w: 315, r: 300)
    }
    .padding()
    .background(Color(.secondarySystemBackground))
}
