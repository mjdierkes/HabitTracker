//
//  Calendar.swift
//  HabitTracker
//
//  Created by Mason Dierkes on 10/21/21.
//

import SwiftUI

struct CalendarView: View {
    
    @State private var currentDate: Date = Date()
    @State private var currentHabit: Habit? = Habit(name: "", imageName: "")
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false){
            VStack(spacing: 20){
                CustomDatePicker(currentDate: $currentDate, habit: $currentHabit)
            }
        }
        
        
    }
}

struct Calendar_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
