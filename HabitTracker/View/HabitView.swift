//
//  HabitView.swift
//  HabitView
//
//  Created by Mason Dierkes on 9/22/21.
//

import SwiftUI

struct HabitView: View {
    
    @Binding var habit: Habit
    @Binding var activeHabit: Habit?
    
    @State private var showingCompleted = false
    @State private var timeRemaining = 2
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let generator = UINotificationFeedbackGenerator()

    
    public let width: CGFloat = 135
    public let height: CGFloat = 135
    
    var body: some View {
        
        VStack{
            ZStack{
                
                if(habit.isCompleted){
                    Circle()
                        .foregroundColor(Color.white)
                        .frame(width: width, height: height)
                }
                else{
                    Circle()
                        .stroke(Color.black, lineWidth: 11)
                        .frame(width: width, height: height)
                        .opacity(0.6)
                }
                
                if(showingCompleted){
                    Image("checkmark")
                        .scaleEffect(0.1)
                        .frame(height: 20)
                        .onReceive(timer) { _ in
                            if timeRemaining > 0 {
                                timeRemaining -= 1
                            }
                            if timeRemaining == 0 {
                                showingCompleted = false
                            }
                        }
                }
                
                else{
                    Image(habit.imageName)
                        .foregroundColor(Color.white)
                        .frame(height: 20)
                        .scaleEffect(0.45)
                }
                
                if(habit.streak > 0 && !showingCompleted){
                    Text("\(habit.streak)")
                        .foregroundColor(habit.isCompleted ? Color.black : Color.white)
                        .bold()
                        .offset(y: 45)
                }
                
            }
            
            Text(habit.name)
                .foregroundColor(Color.white)
                .bold()
                .padding(.top, 7)
            
        }
        .onTapGesture {
            activeHabit = habit
        }
        .onLongPressGesture() {
            
            if(!habit.isCompleted) { generator.notificationOccurred(.success) }
            
            habit.streak += (!habit.isCompleted) ? 1 : -1
            habit.isCompleted.toggle()
            habit.completions[Date().onlyDate!] = true
            print(Date())
            showingCompleted = (habit.isCompleted) ? true : false
        }
        
        
        
    }
    
}

extension Date {

    var onlyDate: Date? {
        get {
            let calendar = Calendar.current
            var dateComponents = calendar.dateComponents([.year, .month, .day], from: self)
            dateComponents.timeZone = NSTimeZone.system
            return calendar.date(from: dateComponents)
        }
    }

}

struct HabitView_Previews: PreviewProvider {
    @State static private var habit = Habit(name: "Workout", imageName: "Lifting-Weights", streak: 28,  isCompleted: true)
    @State static private var activeHabit: Habit? = nil
    
    static var previews: some View {
        HabitView(habit: $habit, activeHabit: $activeHabit)
            .background(Color.black)
    }
}
