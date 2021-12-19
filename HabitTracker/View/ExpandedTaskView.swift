//
//  ExpandedTaskView.swift
//  ExpandedTaskView
//
//  Created by Mason Dierkes on 10/6/21.
//

import SwiftUI

struct ExpandedTaskView: View {
    
    @Binding var presentedHabit: Habit?
    @State private var date = Date()
    var body: some View {
        VStack{
            if let habit = presentedHabit {
                                
                Text(habit.name)
                    .font(.title.bold())
                    .foregroundColor(Color.white)
                    .padding()
                
                CustomDatePicker(currentDate: $date, habit: $presentedHabit)
                
                

            }
            
            Spacer()
            
            
            Button {
                presentedHabit = nil
            } label: {
                Text("Done")
                    .bold()
                    .frame(maxWidth: 300)
                    .padding(10)
                    .foregroundColor(.white)
            }
            .buttonStyle(.bordered)
            
        }
    }
}

struct ExpandedTaskView_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
            .environmentObject(TrackerModel())
    }
}
