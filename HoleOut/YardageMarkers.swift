//
//  YardagesView.swift
//  HoleOut
//
//  Created by Dylan Zarn on 2024-11-01.
//

import SwiftUI

struct YardageMarkers: View {
    
    // store yardages and pin colour
    let blues: Int
    let whites: Int
    let reds: Int
    let isVertical: Bool
    let markerLeft: Bool
    
    // add them in an init
    init(b blues: Int, w whites: Int, r reds: Int, isVertical: Bool = true, markerLeft: Bool = true) {
        self.blues = blues
        self.whites = whites
        self.reds = reds
        self.isVertical = isVertical
        self.markerLeft = markerLeft
    }
    
    var body: some View {
    
        // build circle marker with input colour and yardage
            if isVertical {
                VStack {
                    blueMarker
                    whiteMarker
                    redMarker
                }
                .frame(width: 50)
            } else {
                HStack {
                    blueMarker
                    Spacer()
                    whiteMarker
                    Spacer()
                    redMarker
                }
            }
            
        
    }
    
    private var blueMarker: some View {
        HStack(spacing: 6) {
            if markerLeft {
                Circle()
                    .fill(.blue)
                    .frame(width: 10, height: 10)
            }
            Text(String(blues))
                .font(.footnote)
                .foregroundStyle(.primary)
            if !markerLeft {
                Circle()
                    .fill(.blue)
                    .frame(width: 10, height: 10)
            }
        }
    }
    
    private var whiteMarker: some View {
        HStack(spacing: 6) {
            if markerLeft {
                Circle()
                    .fill(.white)
                    .frame(width: 10, height: 10)
            }
            Text(String(whites))
                .font(.footnote)
                .foregroundStyle(.primary)
            if !markerLeft {
                Circle()
                    .fill(.white)
                    .frame(width: 10, height: 10)
            }
        }
    }
    
    private var redMarker: some View {
        HStack(spacing: 6) {
            if markerLeft {
                Circle()
                    .fill(.red)
                    .frame(width: 10, height: 10)
            }
            Text(String(reds))
                .font(.footnote)
                .foregroundStyle(.primary)
            if !markerLeft {
                Circle()
                    .fill(.red)
                    .frame(width: 10, height: 10)
            }
        }
    }
}

#Preview {
    VStack(spacing: 30) {
        YardageMarkers(b: 321, w: 315, r: 300, isVertical: false, markerLeft: true)
        YardageMarkers(b: 321, w: 315, r: 300, isVertical: false, markerLeft: false)
        YardageMarkers(b: 321, w: 315, r: 300, isVertical: true, markerLeft: true)
        YardageMarkers(b: 321, w: 315, r: 300, isVertical: true, markerLeft: false)
    }
    .padding()
    .background(Color(.secondarySystemBackground))
}
