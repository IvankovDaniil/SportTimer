//
//  SportTimerApp.swift
//  SportTimer
//
//  Created by Даниил Иваньков on 09.07.2025.
//

import SwiftUI

@main
struct SportTimerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainFlow()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
