//
//  WorkoutEx.swift
//  SportTimer
//
//  Created by Даниил Иваньков on 10.07.2025.
//


//MARK: - Получение изображения по типу занятий
extension Workout {
    
    func getImage(type: String) -> String {
        switch type {
        case "Strenght":
            "figure.strengthtraining.functional"
        case "Cardio":
            "figure.mixed.cardio"
        case "Yoga":
            "figure.yoga"
        case "Stretching":
            "figure.strengthtraining.traditional"
        case "Other":
            "ellipsis"
        default: ""
        }
    }
}

extension Workout {
    var timeFormatted: String {
        Int(duration).timeFormatted
    }
}
