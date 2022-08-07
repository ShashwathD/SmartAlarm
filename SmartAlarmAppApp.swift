//
//  SmartAlarmAppApp.swift
//  SmartAlarmApp
//
//  Created by Shashwath Dinesh on 8/6/22.
//

import SwiftUI
import CoreData

@main
struct SmartAlarmAppApp: App {
    @StateObject var viewRouter = ViewRouter()
    @StateObject var notificationRequestManager = NotifRequestManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewRouter: viewRouter)
                .environmentObject(notificationRequestManager)
        }
    }
}
