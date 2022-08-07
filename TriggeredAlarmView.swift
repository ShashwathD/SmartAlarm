//
//  TriggeredAlarmView.swift
//  SmartAlarmApp
//
//  Created by Shashwath Dinesh on 8/6/22.
//

import SwiftUI

struct TriggeredAlarmView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @EnvironmentObject var notifRequestManager: NotifRequestManager

    @State private var currentTab = 1
    @State private var alarmName = "Wake up"
    @State private var alarmTime: Int16 = 0

    var body: some View {
        Group {
            switch currentTab {
                case 1:
                    AlarmNotificationView(currentPage: $currentTab, alarmName: alarmName, alarmTime: alarmTime)
                case 2:
                    AlarmStop(currentPage: $currentTab, alarmTime: alarmTime)
                        .environmentObject(viewRouter)
                        .environmentObject(notifRequestManager)
                case 3:
                    ContentView(viewRouter: viewRouter)
                default:
                    EmptyView()
            }
        }
        .onAppear(perform: {
            alarmName = (notifRequestManager.notificationData.notification.request.content.userInfo["title"] as? String)!
            let time = (notifRequestManager.notificationData.notification.request.content.userInfo["duration"] as? String)!
            
            let str = time.split(separator: " ")
            alarmTime = Int16(Double(str[0])! * 60)
        })
    }
}

struct TriggeredAlarmView_Previews: PreviewProvider {
    static var previews: some View {
        TriggeredAlarmView()
    }
}
