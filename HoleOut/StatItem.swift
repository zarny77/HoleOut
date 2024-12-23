//
//  StatItem.swift
//  HoleOut
//
//  Created by Dylan Zarn on 2024-12-22.
//

import SwiftUI

struct StatItem: View {
    
    let label: String
    let value: Int
    
    var body: some View {
        HStack {
            Text(label)
                .foregroundStyle(.secondary)
            Text(String(value))
                .fontWeight(.bold)
        }
        .font(.subheadline)
    }
}

#Preview {
    StatItem(label: "Average", value: 92)
}
