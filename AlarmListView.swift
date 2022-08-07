//
//  AlarmListView.swift
//  Alarm
//
//  Created by Shashwath Dinesh on 8/5/22.
//


import SwiftUI

struct AlarmListView: View {
    @StateObject private var viewModel = AlarmModel()
    @State private var editMode = false
    
    var body: some View {
        Group {
            if viewModel.alarms.isEmpty {
                VStack {
                    Text("Click the '+' to add an alarm.")
                        .font(.title3)
                }
            } else {
                ScrollView {
                    ForEach(viewModel.alarms, id:\.self) { alarm in
                        ZStack {
                            HStack {
                                DeleteAlarm(alarm: alarm)
                            }
                            HStack {
                                ActivitiesProgress(alarm: alarm)
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("Smart Alarm")
    }
}
