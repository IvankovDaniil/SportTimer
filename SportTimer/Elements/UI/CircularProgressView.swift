//
//  CircularProgressView.swift
//  SportTimer
//
//  Created by Даниил Иваньков on 10.07.2025.
//

import SwiftUI

struct CircularProgressView: View {
    let progress: Double
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    Color.second.opacity(0.5),
                    lineWidth: 20
                )
            
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    Color.second,
                    style: StrokeStyle(lineWidth: 20, lineCap: .round)
                )
                .rotationEffect(.degrees(-90))
                .animation(.easeOut, value: progress)
        }
    }
}
