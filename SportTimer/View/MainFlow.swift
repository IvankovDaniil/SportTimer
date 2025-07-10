//
//  MainFlow.swift
//  SportTimer
//
//  Created by Даниил Иваньков on 09.07.2025.
//

import SwiftUI

enum TabFlow {
    case home, timer, history, profile
}

struct MainFlow: View {
    @StateObject var timerViewModel: TimerViewModel = TimerViewModel()
    
    @State var tabFlow: TabFlow = .home
    
    var body: some View {
        TabView(selection: $tabFlow) {
            HomeView(timerViewModel: timerViewModel, action: {
                tabFlow = .timer
            })
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(TabFlow.home)
            
            TimerView(timerViewModel: timerViewModel)
                .tabItem {
                    Label("Timer", systemImage: "timer")
                }
                .tag(TabFlow.timer)
            
            HistoryView()
                .tabItem {
                    Label("History", systemImage: "clock")
                }
                .tag(TabFlow.history)
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
                .tag(TabFlow.profile)
        }

    }
}

#Preview {
    MainFlow()
}
