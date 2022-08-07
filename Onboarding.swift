//
//  Onboarding.swift
//  SmartAlarmApp
//
//  Created by Shashwath Dinesh on 8/7/22.
//


import SwiftUI

struct Onboarding: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State private var currentTab = 0
    
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
    }
    
    var body: some View {
        TabView(selection: $currentTab,
                content:  {
                    SecondPage()
                        .tag(2)
                })
            .environmentObject(viewRouter)
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}

