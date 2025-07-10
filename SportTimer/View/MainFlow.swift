//
//  MainFlow.swift
//  SportTimer
//
//  Created by Даниил Иваньков on 09.07.2025.
//

import SwiftUI

struct MainFlow: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            HomeView()
                .tabItem {
                    Label("Timer", systemImage: "timer")
                }
            
            HomeView()
                .tabItem {
                    Label("History", systemImage: "clock")
                }
            
            HomeView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
        }

    }
}

#Preview {
    MainFlow()
}
