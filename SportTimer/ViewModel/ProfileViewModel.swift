//
//  ProfileViewModel.swift
//  SportTimer
//
//  Created by Даниил Иваньков on 11.07.2025.
//

import PhotosUI
import CoreData
import _PhotosUI_SwiftUI


final class ProfileViewModel {
    func getStats(workouts: [Workout], type: WorkoutType) -> Int {
        return workouts.filter { $0.type == type.type }.count
    }
    
    func resetStats(workouts: [Workout], context: NSManagedObjectContext) {
        for workout in workouts {
            context.delete(workout)
        }
        
        try? context.save()
    }
}
