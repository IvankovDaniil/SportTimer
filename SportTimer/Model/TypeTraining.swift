//
//  TypeTraining.swift
//  SportTimer
//
//  Created by Даниил Иваньков on 09.07.2025.
//

import Foundation

enum TypeTraining: Identifiable, CaseIterable {
    case strength, cardio, yoga, stretching, other
    
    var id: String { self.type }
}

extension TypeTraining {
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
