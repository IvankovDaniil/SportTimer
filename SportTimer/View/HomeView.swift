//
//  HomeView.swift
//  SportTimer
//
//  Created by Даниил Иваньков on 09.07.2025.
//

import SwiftUI
import CoreData

struct HomeView: View {
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Workout.date, ascending: false)], animation: .default)
    private var workouts: FetchedResults<Workout>
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                Text("Hello user")
                Spacer()
                Text("Сколько тренировок провели: ")
            }
            .font(type: .regular)
            
            Spacer()
            
            Button {
                //
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(.second)
                        .frame(height: 100)
                    Text("START TRAINING")
                        .font(type: .bold)
                }
            }
            
            Spacer()
            
            LastThreetraingView(workout: Array(workouts.prefix(3)))

        }
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.bg)
        
    }
}

#Preview {
    HomeView()
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


struct TrainingCardView: View {
    let workout: Workout
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(workout.date, style: .date)
                Spacer()
                Text(workout.type)
                Spacer()
                Text(workout.duration.description)
            }
            
            Text(workout.notes ?? "Without notes")
        }
    }
}
