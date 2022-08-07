//
//  DeleteAlarm.swift
//  SmartAlarm
//
//  Created by Shashwath Dinesh on 8/6/22.
//

import SwiftUI

struct DeleteAlarm: View {
    @StateObject private var viewModel = AlarmModel()
    var alarm: Alarm
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.red)
            HStack {
                Spacer()
                VStack(spacing: 10) {
                    Image(systemName: "trash.fill")
                    Text("Delete")
                }
                .padding()
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.red)
        .foregroundColor(.white)
        .cornerRadius(25)
        .padding(EdgeInsets(top: 0, leading: 15, bottom: 15, trailing: 15))
        .onTapGesture {
            viewModel.delete(alarm: alarm)
        }
    }
}

