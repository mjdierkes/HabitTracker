//
//  ContentView.swift
//  HabitTracker
//
//  Created by Mason Dierkes on 9/22/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var model = TrackerModel()
    var body: some View {
//        CalendarView()
        HomePage()
            .environmentObject(model)
//            MainView()
//        Test()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
