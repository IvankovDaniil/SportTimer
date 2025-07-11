//
//  TimeForatted+Ext.swift
//  SportTimer
//
//  Created by Даниил Иваньков on 11.07.2025.
//

extension Int {
    var timeFormatted: String {
        let hours = self / 3600
        let minutes = (self % 3600) / 60
        let seconds = self % 60
        
        if hours > 0 {
            return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
        } else {
            return String(format: "%02d:%02d", minutes, seconds)
        }
    }
}
