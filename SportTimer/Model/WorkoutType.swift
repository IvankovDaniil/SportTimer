//
//  TypeTraining.swift
//  SportTimer
//
//  Created by Даниил Иваньков on 09.07.2025.
//

enum WorkoutType: Identifiable, CaseIterable {
    case strength, cardio, yoga, stretching, other
    
    var id: String { self.type }
}

extension WorkoutType {
    var type: String {
        switch self {
        case .strength:
            "Strenght"
        case .cardio:
            "Cardio"
        case .yoga:
            "Yoga"
        case .stretching:
            "Stretching"
        case .other:
            "Other"
        }
        
    }
}

extension WorkoutType {
    var image: String {
        switch self {
        case .strength:
            "figure.strengthtraining.functional"
        case .cardio:
            "figure.mixed.cardio"
        case .yoga:
            "figure.yoga"
        case .stretching:
            "figure.strengthtraining.traditional"
        case .other:
            "ellipsis"
        }
    }
}
