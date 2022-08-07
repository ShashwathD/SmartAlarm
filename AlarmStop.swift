//
//  AlarmStop.swift
//  SmartAlarmApp
//
//  Created by Shashwath Dinesh on 8/6/22.
//

import SwiftUI

struct AlarmStop: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var notifRequestManager: NotifRequestManager
    @Binding var currentPage: Int
    
    var alarmTime: Int16
    
    @ObservedObject private var viewModel = AlarmTriggeredViewModel()
    
    init(currentPage: Binding<Int>, alarmTime: Int16) {
        self._currentPage = currentPage
        self.alarmTime = alarmTime
        
        self.viewModel.activityDuration = alarmTime
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)), Color(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
            VStack(spacing: 40) {
                Text("Let's walk for \(String(format: "%.1f", Double(alarmTime) / 60)) minutes!")
                    .font(.title)
                    .bold()
                CircleProgress(value: $viewModel.progress)
                    .frame(width: 250, height: 250, alignment: .center)
                Text(viewModel.activityStatus)
                    .font(.title2)
                Spacer()
                if viewModel.alarmStopped {
                    Button(action: finishActivity, label: {
                        Text("Finish")
                            .frame(width: 250, height: 45, alignment: .center)
                            .background(Color(#colorLiteral(red: 0.8862745098, green: 0.8352941176, blue: 0.8, alpha: 1)))
                            .cornerRadius(25)
                            .foregroundColor(.black)
                    })
                    .buttonStyle(PlainButtonStyle())
                    .offset(y: -250)
                }
            }
            .offset(y: 125)
        }
        .foregroundColor(.white)
        .edgesIgnoringSafeArea(.all)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
//        ZStack {
//            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)), Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
//            VStack(spacing: 40) {
//                Text("Let's do some math for \(String(format: "%.1f", Double(alarmTime) / 60)) minutes!")
//                MathGameAppView()
//                CircleProgress(value: $viewModel.progress)
//                    .frame(width: 250, height: 250, alignment: .center)
//                Text(viewModel.activityStatus)
//                    .font(.title2)
//                Spacer()
//                if viewModel.alarmStopped {
//                    Button(action: finishActivity, label: {
//                        Text("Finish")
//                            .frame(width: 250, height: 45, alignment: .center)
//                            .background(Color(#colorLiteral(red: 0.8862745098, green: 0.8352941176, blue: 0.8, alpha: 1)))
//                            .cornerRadius(25)
//                            .foregroundColor(.black)
//                    })
//                    .buttonStyle(PlainButtonStyle())
//                    .offset(y: -250)
//                }
//            }
//            .offset(y: 125)
//        }
//        .foregroundColor(.white)
//        .edgesIgnoringSafeArea(.all)
//        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
//
    private func finishActivity() {
        withAnimation {
            notifRequestManager.notificationData = nil
            
            currentPage = 3
            viewRouter.currentPage = .alarm
        }
    }
}

struct AlarmStopView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmStop(currentPage: .constant(2), alarmTime: 10)
    }
}
