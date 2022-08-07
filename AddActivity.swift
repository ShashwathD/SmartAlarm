//
//  AddActivity.swift
//  SmartAlarmApp
//
//  Created by Shashwath Dinesh on 8/6/22.
//

import Foundation
import SwiftUI

struct AddActivity: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var checked = false
    
    var body: some View {
        NavigationView {
            List {
                HStack {
                Text("Puzzle")
                CheckBoxView(checked: $checked)
                }
                HStack {
                Text("Math")
                CheckBoxView(checked: $checked)
                }
                HStack {
                Text("Walk")
                CheckBoxView(checked: $checked)
                }
            }.listStyle(InsetGroupedListStyle())
        }
    }
}
