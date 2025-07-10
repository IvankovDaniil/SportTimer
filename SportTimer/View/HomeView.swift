//
//  HomeView.swift
//  SportTimer
//
//  Created by Даниил Иваньков on 09.07.2025.
//

import SwiftUI
import CoreData

struct HomeView: View {
    @ObservedObject var timerViewModel: TimerViewModel
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Workout.date, ascending: false)], animation: .default)
    private var workouts: FetchedResults<Workout>
    
    let action: () -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                Text("Hello, user")
                    .font(type: .semibold)
                Spacer()
                Text("Total workouts: \(workouts.count) ")
                    .font(type: .secondary, .txtSecondary)
            }
            .font(type: .regular)
            
            Spacer()
            
            Button {
                action()
                timerViewModel.startTimer()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(timerViewModel.timerState == .running ? .danger : .second)
                        .frame(height: 100)
                    Text(timerViewModel.timerState == .running ? "STOP WORKOUT" : "START WORKOUT")
                        .font(type: .bold)
                }
            }
            
            Spacer()
            if !Array(workouts).isEmpty {
                Text("Last three workouts: ")
                    .font(type: .bold)
                LastThreetraingView(workout: Array(workouts.prefix(3)))
            }
        }
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.bg)
        .padding(.bottom, 8)
        
    }
}

private struct LastThreetraingView: View {
    let workout: [Workout]
    
    var body: some View {
        VStack {
            ForEach(workout) { workout in
                TrainingCardView(workout: workout)
            }
        }
    }
}


private struct TrainingCardView: View {
    let workout: Workout
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(.bg)
                .shadow(radius: 2, y: 2)
                .overlay(content: {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(.second, lineWidth: 1)
                })
                .frame(height: 120)
                
            
            VStack(alignment: .leading) {
                Text(workout.date, style: .date)
                    .font(type: .secondary, .txtSecondary)
                HStack {
                    Image(systemName: workout.getImage(type: workout.type))
                        .resizable()
                        .frame(width: 15, height: 15)
                    Text(workout.type)
                    Spacer()
                    Text(workout.timeFormatted)
                }

                VStack(alignment: .leading, spacing: 2) {
                    Text("Notes:")
                        .font(type: .secondary, .txtSecondary)
                    
                    Text(workout.notes ?? "Without notes")
                        .lineLimit(2)
                }
            }
            .font(type: .regular)
            .padding(8)
        }
    }
}
