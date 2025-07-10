//
//  TimerViewModel.swift
//  SportTimer
//
//  Created by Даниил Иваньков on 10.07.2025.
//

import SwiftUI
import CoreData


final class TimerViewModel: ObservableObject {
    @Published var timerState: TimerState = .stop
    @Published var type: WorkoutType = .cardio
    @Published var notes: String = ""
    @Published var totalTime: Int = 7200 //2 часа
    @Published var timeElapsed: Int = 0
    @Published var progress: Double = 0.0
    
    @Published var isAdd: Bool = false // Добавление тренировки
    
    private var timer: Timer?
    private var startDate: Date?
    
    func startTimer() {
        guard timerState != .running else {
            return
        }
        timerState = .running
        
        startDate = Date().addingTimeInterval(-TimeInterval(timeElapsed))
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.tick()
        }
        
    }
    
    func stopTimer() {
        guard timerState != .stop else {
            return
        }
        
        timer?.invalidate()
        timer = nil
        timerState = .stop
        timeElapsed = 0
        progress = 0.0
        notes = ""
        startDate = nil
        isAdd = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.isAdd = false
        }
    }
    
    func pauseTimer() {
        guard timerState != .pause else {
            return
        }
        
        timer?.invalidate()
        timerState = .pause
    }
    
    func tick() {
        guard timeElapsed < totalTime else {
            stopTimer()
            return
        }
        timeElapsed += 1
        progress = Double(timeElapsed) / Double(totalTime)
    }
    
    //MARK: - Запись времени в фоновом режиме
    func updateTimer() {
        guard let startDate =  startDate else { return }
        
        timeElapsed = Int(Date().timeIntervalSince(startDate))
        progress = Double(timeElapsed) / Double(totalTime)
        
        guard timeElapsed < totalTime else {
            stopTimer()
            return
        }
    }
    
    //MARK: - Сохрание в CoreData
    func saveWorkout(context: NSManagedObjectContext) {
        let workout = Workout(context: context)
        workout.id = UUID()
        workout.date = Date()
        if notes == "" {
            workout.notes = nil
        } else {
            workout.notes = notes
        }
        workout.duration = Int32(timeElapsed)
        workout.type = type.type
        
        try? context.save()
    }
}

//MARK: - Состояния таймера
extension TimerViewModel {
    enum TimerState {
        case stop, running, pause
    }
}

//MARK: - Форматирование во время
extension TimerViewModel {
    var timeFormatted: String {
        let hours = timeElapsed / 3600
        let minutes = (timeElapsed % 3600) / 60
        let seconds = timeElapsed % 60
        
        if hours > 0 {
            return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
        } else {
            return String(format: "%02d:%02d", minutes, seconds)
        }
    }
}
