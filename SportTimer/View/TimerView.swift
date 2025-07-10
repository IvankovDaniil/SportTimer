//
//  TimerView.swift
//  SportTimer
//
//  Created by Даниил Иваньков on 10.07.2025.
//

import SwiftUI

struct TimerView: View {
    @StateObject var timerViewModel: TimerViewModel = TimerViewModel()
    @State var notes: String = ""
    
    var body: some View {
        VStack(spacing: 30) {
            VStack(spacing: 20) {
                ZStack {
                    CircularProgressView(progress: timerViewModel.progress)
                        .frame(width: 150, height: 150)
                    
                    Text(timerViewModel.timeFormatted)
                        .font(type: .bold)
                }
                
                
                ActionTimerButtonView(viewModel: timerViewModel)
            }
            
            HStack {
                Text("Type training")
                    .font(type: .semibold)
                Spacer()
                Picker("Type training", selection: $timerViewModel.type) {
                    ForEach(TypeTraining.allCases) { training in
                        Text(training.type)
                            .font(type: .regular)
                            .tag(training)
                    }
                }
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Notes:")
                    .font(type: .semibold)
                
                TextEditor(text: $notes)
                    .frame(height: 200)
            }
        }
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.bg)
    }
}


#Preview {
    TimerView(timerViewModel: TimerViewModel())
}


private struct ActionTimerButtonView: View {
    @ObservedObject var viewModel: TimerViewModel
    
    var body: some View {
        HStack {
            Button {
                viewModel.pauseTimer()
            } label: {
                Image(systemName: "pause.circle")
                    .resizable()
                    .frame(width: 44, height: 44)
            }
            
            Button {
                viewModel.startTimer()
            } label: {
                Image(systemName: "play.circle")
                    .resizable()
                    .frame(width: 44, height: 44)
            }
            
            Button {
                viewModel.stopTimer()
            } label: {
                Image(systemName: "stop.circle")
                    .resizable()
                    .frame(width: 44, height: 44)
            }

        }
        .frame(maxWidth: .infinity)
    }
}
