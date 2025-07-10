//
//  ProfileView.swift
//  SportTimer
//
//  Created by Даниил Иваньков on 11.07.2025.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: 70, height: 70)
                
                Button {
                    //
                } label: {
                    ZStack {
                        Circle()
                            .fill(.second)
                            .frame(width: 20, height: 20)
                        Image(systemName: "repeat")
                            .resizable()
                            .frame(width: 10, height: 10)
                            .foregroundStyle(.danger)
                    }
                }

            }
        }
    }
}

