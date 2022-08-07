//
//  NotifRequest.swift
//  SmartAlarmApp
//
//  Created by Shashwath Dinesh on 8/6/22.
//

import SwiftUI

class NotifRequestManager: NSObject, ObservableObject {
    @Published var notificationData: UNNotificationResponse!
    
    override init() {
        super.init()
        UNUserNotificationCenter.current().delegate = self
    }
}

extension NotifRequestManager: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        self.notificationData = response
        
        completionHandler()
    }
}
