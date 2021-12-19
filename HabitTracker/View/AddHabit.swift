//
//  AddHabit.swift
//  HabitTracker
//
//  Created by Mason Dierkes on 10/20/21.
//

import SwiftUI

struct AddHabit: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var model: TrackerModel
    
    @State private var name: String = ""
    
    var body: some View {
        
        
        ZStack {
            Color.orange
                .ignoresSafeArea()
            VStack{
                
                Text("Add Habit")
                HStack{
                    
                    ForEach(0..<5) { _ in
                        ZStack{
                            Circle()
                                .frame(width: 40, height: 40)
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(Color.white)
                        }
                        
                    }
                    
                    
                }
                
                Text("Tasks start each day as incomplete. Mark a task as done to increase your streak.")
                
                TextField("Enter task title...", text: $name)
                
                Button("Press to dismiss") {
                    model.habits.append(Habit(name: name, imageName: "Lifting-Weights"))
                    dismiss()
                }
                
                Spacer()
                
                
                
            }
            .padding()
        }
        
        
        
        
    }
}

struct AddHabit_Previews: PreviewProvider {
    @State private static var isPresented = true
    static var previews: some View {
        AddHabit()
    }
}
