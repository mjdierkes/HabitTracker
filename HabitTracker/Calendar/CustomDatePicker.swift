//
//  CustomDatePicker.swift
//  HabitTracker
//
//  Created by Mason Dierkes on 10/21/21.
//

import SwiftUI
import Foundation

struct CustomDatePicker: View {
    
    @Binding var currentDate: Date
    @Binding var habit: Habit?
    @State private var currentMonth: Int = 0
    
    var body: some View {
        VStack(spacing: 35){
            
            let days: [String] = ["S", "M", "T", "W", "T", "F", "S"]
            
            HStack(spacing: 20){
                VStack(alignment: .leading, spacing: 10){
//                    Text(extraDate()[0])
//                        .font(.caption)
//                        .fontWeight(.semibold)
                    
                    Text(extraDate()[1])
                        .font(.title.bold())
                }
                
                Spacer(minLength: 0)

                Button {
                    currentMonth -= 1
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                }
                
                Button {
                    currentMonth += 1
                } label: {
                    Image(systemName: "chevron.right")
                }
                
                
            }
            .padding(.horizontal)
            
            HStack(spacing: 0){
                ForEach(days, id: \.self){ day in
                    Text(day)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                }
            }
            
            
            let columns = Array(repeating: GridItem(), count: 7)
            
            LazyVGrid(columns: columns, spacing: 15){
                
                ForEach(extractDate()){ value in
                    CardView(value: value)
                }
            }
        }
        .onChange(of: currentMonth) { newValue in
            currentDate = getCurrentMonth()
        }
    
        
    }
    
    @ViewBuilder
    func CardView(value: DateValue) -> some View {
        
        VStack{
            if value.day != -1{
                
//                Image(systemName: "xmark")
//                Text("\(value.day)")
//                    .font(.title3.bold())
                
                if let habit = habit{
                    if(habit.completions[value.date] == true){
                        Image(systemName: "checkmark")

                    }
                    else {
                        Image(systemName: "xmark")
                    }
                }
              
                
//                Spacer()
            }
        }
//        .padding(.vertical, 8)
//        .frame(height: 20, alignment: .top)
    }
    
    
    func isSameDay(date1: Date, date2: Date) -> Bool{
        let calendar = Calendar.current
        return calendar.isDate(date1, inSameDayAs: date2)
    }
    
    
    func extraDate() -> [String] {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MMMM"
        
        let date = formatter.string(from: currentDate)
        
        return date.components(separatedBy: " ")
    }
    
    
    func getCurrentMonth() -> Date {
        
        let calendar = Calendar.current
        
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date()) else{
            return Date()
        }
        return currentMonth
    }
    
    
    func extractDate() -> [DateValue]{

        let calendar = Calendar.current
            
        let currentMonth = getCurrentMonth()
        
        var days = currentMonth.getAllDates().compactMap { date ->
            DateValue in
            
            let day = calendar.component(.day, from: date)
            return DateValue(day: day, date: date)

        }
        let firstWeekday = calendar.component(.weekday, from: days.first?.date ?? Date())
        
        for _ in 0..<firstWeekday - 1{
            days.insert(DateValue(day: -1, date: Date()), at: 0)
        }
        
        return days

    }
    
}

struct CustomDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}

extension Date {
    func getAllDates() -> [Date] {

        let calendar = Calendar.current

        let startDate = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: self))!
        
        let range = calendar.range(of: .day, in: .month, for: startDate)!
        
        return range.compactMap { day -> Date in

            return calendar.date(byAdding: .day, value: day - 1, to: startDate)!

        }
    }
}
