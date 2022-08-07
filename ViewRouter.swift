//
//  ViewRouter.swift
//  SmartAlarm
//
//  Created by Shashwath Dinesh on 8/6/22.
//

import SwiftUI

enum Page {
    case onboarding
    case notificationRequest
    case alarm
    case puzzlepiece
}

class ViewRouter: ObservableObject {
    @Published var currentPage: Page
    
    init() {
        if !UserDefaults.standard.bool(forKey: "didLaunchBefore") {
            currentPage = .onboarding
        } else {
            currentPage = .alarm
        }
    }
}


