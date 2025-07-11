//
//  HomeViewModel.swift
//  SportTimer
//
//  Created by Даниил Иваньков on 11.07.2025.
//

final class HomeViewModel {
    func countTotalDuration(workouts: [Workout]) -> String {
       let count = workouts.reduce(into: 0) { partialResult, workout in
            partialResult += workout.duration
        }
        
        return Int(count).timeFormatted
    }
    
}
