//
//  ProfileView.swift
//  SportTimer
//
//  Created by Даниил Иваньков on 11.07.2025.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    @Environment(\.managedObjectContext) var context
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Workout.date, ascending: false)], animation: .default)
    private var workouts: FetchedResults<Workout>
    private let profileViewModel = ProfileViewModel()
    
    let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    
    @AppStorage("isMusicEnable") var isMusicEnable: Bool = true
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 30) {
                    ProfileImageView()
                    
                    VStack(spacing: 5) {
                        Text("Statistics")
                            .font(type: .bold)
                        HStack {
                            ProfileStatisticsView(viewModel: profileViewModel, workouts: Array(workouts))
                            Spacer()
                        }
                        HStack {
                            Button {
                                profileViewModel.resetStats(workouts: Array(workouts), context: context)
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(.warning)
                                    
                                    Text("Reset statistics")
                                        .font(type: .bold)
                                }
                            }
                        }
                    }
                    SettingsProfileView(isMusicEnable: $isMusicEnable)
                }
                .padding(.horizontal, 16)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Text("v.\(version ?? "")")
                            .font(type: .secondary, .txtSecondary)
                    }
                }
            }
            .scrollIndicators(.never)
            .scrollContentBackground(.hidden)
            .background(Color.bg.ignoresSafeArea())
        }
       
    }
}

private struct ProfileImageView: View {
    @AppStorage("userAvatar") private var imageData: Data?
    @State private var selectedItem: PhotosPickerItem?
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            if let imageData, let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
            } else {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
            }

            Button {
                //
            } label: {
                PhotosPicker(selection: $selectedItem, matching: .images) {
                    ZStack {
                        Circle()
                            .fill(.second)
                            .frame(width: 40, height: 40)
                        Image(systemName: "repeat")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.white)
                    }
                }
            }
            
        }
        .onChange(of: selectedItem) { newValue in
            Task {
                if let data = try? await newValue?.loadTransferable(type: Data.self) {
                    imageData = data
                }
            }
        }
        
    }
}

private struct ProfileStatisticsView: View {
    let viewModel: ProfileViewModel
    let workouts: [Workout]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Total workouts: \(workouts.count)")
            
            ForEach(WorkoutType.allCases) { type in
                Text("\(type.type): \(viewModel.getStats(workouts: workouts, type: type))")
            }
        }
        .font(type: .semibold)
    }
}

private struct SettingsProfileView: View {
    @Binding var isMusicEnable: Bool
    
    var body: some View {
        VStack(spacing: 5){
            Text("Settings")
                .font(type: .bold)
            
            Toggle("Звуки", isOn: $isMusicEnable)
                .toggleStyle(.switch)
                .tint(.second)
                .font(type: .semibold)
        }
    }
}

#Preview {
    ProfileView()
}
