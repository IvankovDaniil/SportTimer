//
//  HistoryViewModel.swift
//  SportTimer
//
//  Created by Даниил Иваньков on 10.07.2025.
//

import CoreData

final class HistoryViewModel: ObservableObject {
    
    func sortWorkout(workouts: [Workout]) -> [WorkoutSection] {
        
        let grouped = Dictionary(grouping: workouts) { workout in
            Calendar.current.startOfDay(for: workout.date)
        }
        
        let section = grouped.map { (date, workouts) in
            WorkoutSection(id: date, workouts: workouts)
        }
            .sorted { $0.id > $1.id }
        
        return section
    }
    
    func deleteTraining(context: NSManagedObjectContext, workout: Workout) {
        context.delete(workout)
        try? context.save()
    }
}
