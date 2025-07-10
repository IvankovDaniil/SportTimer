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

//MARK: - Форматирование во время
extension Workout {
    var timeFormatted: String {
        let totalSec = Int(self.duration)
        let hours = totalSec / 3600
        let minutes = (totalSec % 3600) / 60
        let seconds = totalSec % 60
        
        if hours > 0 {
            return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
        } else {
            return String(format: "%02d:%02d", minutes, seconds)
        }
    }
}
