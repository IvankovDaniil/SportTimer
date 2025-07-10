//
//  HistoryView.swift
//  SportTimer
//
//  Created by Даниил Иваньков on 10.07.2025.
//

import SwiftUI

struct HistoryView: View {
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Workout.date, ascending: false)], animation: .default)
    private var workouts: FetchedResults<Workout>
    @State var historyViewModel = HistoryViewModel()
    
    @State private var searchText = ""
    
    var searchResults: [Workout] {
            if searchText.isEmpty {
                return Array(workouts)
            } else {
                return workouts.filter { workout in
                    workout.notes?.localizedCaseInsensitiveContains(searchText) ?? false ||
                    workout.type.localizedCaseInsensitiveContains(searchText)
                }
            }
        }
    
    var body: some View {
        if Array(workouts).isEmpty {
            VStack {
                Text("Start training to see your history")
                    .font(type: .bold)
            }
            .padding(.horizontal, 16)
        } else {
            NavigationStack {
                List {
                    WorkoutsForEachView(viewModel: historyViewModel, workouts: searchResults)
                }
            }
            .searchable(text: $searchText, prompt: "Search")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.bg)
        }
    }
}


private struct WorkoutsForEachView: View {
    @Environment(\.managedObjectContext) var context
    @ObservedObject var viewModel: HistoryViewModel
    
    let workouts: [Workout]
    
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter
    }()
    
    var body: some View {
        ForEach(viewModel.sortWorkout(workouts: Array(workouts))) { section in
            Section(dateFormatter.string(from: section.id)) {
                ForEach(section.workouts) { workout in
                    WorkoutListView(workout: workout)
                        .swipeActions {
                            Button(role: .destructive) {
                                viewModel.deleteTraining(context: context, workout: workout)
                            } label: {
                                HStack {
                                    Image(systemName: "trash")
                                    Text("Delete")
                                        .font(type: .secondary)
                                }
                            }
                        }
                }
            }
        }
    }
}

private struct WorkoutListView: View {
    let workout: Workout
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 10) {
                Text(workout.date, style: .date)
                    .font(type: .secondary, .txtSecondary)
                
                HStack {
                    Image(systemName: workout.getImage(type: workout.type))
                        .resizable()
                        .frame(width: 15, height: 15)
                    Text(workout.type)
                    Spacer()
                    Text(workout.timeFormatted)
                }
                
                Text(workout.notes ?? "Without notes")
            }
            .font(type: .regular)
            .padding(8)
        }
    }
}

