//
//  HistoryView.swift
//  SportTimer
//
//  Created by Даниил Иваньков on 10.07.2025.
//

import SwiftUI

struct HistoryView: View {
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Workout.date, ascending: false)], animation: .default)
    private var workouts: FetchedResults<Workout>
    
    var body: some View {
        VStack {
            
        }
    }
}
