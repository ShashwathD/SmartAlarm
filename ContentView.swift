//
//  ContentView.swift
//  SmartAlarmApp
//
//  Created by Shashwath Dinesh on 8/6/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewRouter: ViewRouter
    @EnvironmentObject var notifRequestManager: NotifRequestManager
    @State var showPopUp = false
    
    var body: some View {
        if (notifRequestManager.notificationData != nil) {
            TriggeredAlarmView()
                .environmentObject(notifRequestManager)
                .environmentObject(viewRouter)
        } else if viewRouter.currentPage == .onboarding {
            Onboarding()
                .environmentObject(viewRouter)
        } else if viewRouter.currentPage == .notificationRequest {
            NotifRequest()
                .environmentObject(viewRouter)
        } else {
            GeometryReader { geometry in
                NavigationView {
                    VStack {
                        Spacer()
                        AlarmListView()
                        Spacer()
                        ZStack {
                            if self.showPopUp {
                                PlusMenu(size: geometry.size.width / 8)
                                    .offset(y: -geometry.size.height / 8)
                            }
                            HStack {
//                                ClockTabItem(viewRouter: viewRouter, width: geometry.size.width / 3, height: geometry.size.height / 28, pageName: .alarm, iconName: "alarm")
                                VStack {
                                    CircleButton(imageName: "plus", size: geometry.size.width / 7 - 4) {
                                        withAnimation {
                                            requestNotification()
                                            self.showPopUp.toggle()
                                        }
                                    }
                                }
                                .rotationEffect(Angle(degrees: self.showPopUp ? 45 : 0))
                                .offset(y: -geometry.size.height / 8 / 2)
//                                ClockTabItem(viewRouter: viewRouter, width: geometry.size.width / 3, height: geometry.size.height / 28, pageName: .puzzlepiece, iconName: "puzzlepiece")
                            }
                            .frame(width: geometry.size.width, height: geometry.size.height / 8)
                            .background(Color("TabBarBackground").shadow(radius: 1))
                        }
                    }
                    .edgesIgnoringSafeArea(.bottom)
                }
            }
        }
    }
    
    private func requestNotification() {
        NotifManager.shared.requestNotificationPermission {
//            withAnimation {
//                DispatchQueue.main.async {
//                    self.viewRouter.currentPage = .alarm
//                }
//            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter())
    }
}

struct PlusMenu: View {
    @State private var showAddAlarm = false
    @State private var showAddActivity = false
    
    let size: CGFloat
   
    var body: some View {
        HStack(spacing: 50) {
            CircleButton(imageName: "alarm", size: size) {
                self.showAddAlarm = true
            }
            .sheet(isPresented: $showAddAlarm) {
                NewAlarm()
            }
            CircleButton(imageName: "puzzlepiece", size: size) {
                self.showAddActivity = true
            }
            .sheet(isPresented: $showAddActivity) {
                AddActivity()
            }
        }
        .transition(.scale)
    }
}

struct CircleButton: View {
    var imageName: String
    var size: CGFloat
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                Circle()
                    .fill(Color("CenterButton"))
                    .frame(width: size, height: size)
                Image(systemName: imageName)
                    .foregroundColor(.white)
            }
        }
    }
}
