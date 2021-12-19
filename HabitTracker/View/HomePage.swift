//
//  HomePage.swift
//  HomePage
//
//  Created by Mason Dierkes on 10/6/21.
//

import SwiftUI

struct HomePage: View {
    
    
    @EnvironmentObject var model: TrackerModel
    @State private var showingDetail = false
    @State private var activeHabit: Habit? = nil
    @State private var presentingModal = false
    
    
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    
    var body: some View {
        ZStack{
            Color.orange
                .ignoresSafeArea()
            
            if activeHabit != nil{
                ExpandedTaskView(presentedHabit: $activeHabit)
            }
        
            else{
                VStack{
                    ZStack{
                        HStack(alignment: .center){
                            Text("Tasks")
                                .foregroundColor(Color.white)
                                .bold()
                        }
                        HStack{
                            Spacer()
                            Button {
                                presentingModal = true
                            } label: {
                                Image(systemName: "plus")
                                    .foregroundColor(Color.blue)
                            }
                            .buttonStyle(.bordered)
                            .sheet(isPresented: $presentingModal){
                                AddHabit()
                            }
                        }
                    }
                    
                    
                    LazyVGrid(columns: columns, spacing: 50){
                        ForEach($model.habits) { habit in
                            
                            HabitView(habit: habit, activeHabit: $activeHabit)
                            
                        }
                    }
                    .padding(.top)
                    .edgesIgnoringSafeArea(.all)
                    
                    Spacer()
                    
                }
                .padding()
            }

        }
        
    }
}

struct HomePage_Previews: PreviewProvider {
    @State private static var model = TrackerModel()
    static var previews: some View {
        HomePage()
            .environmentObject(model)
    }
}
