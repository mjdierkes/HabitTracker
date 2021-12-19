//
//  TimerPage.swift
//  TimerPage
//
//  Created by Mason Dierkes on 10/12/21.
//

import SwiftUI

struct TimerPage: View {
    
    @State private var timeRemaining = 10
        let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        GeometryReader { bounds in
            ZStack{
                Color.green
                VStack{
                    Text("\(timeRemaining)")
                        .font(.custom("Avenir Next", size: 125))
                        .bold()
                    Text("Minutes Until Goal")
                        .bold()
                    
                    Button {
                        
                    } label: {
                        Text("Start")
                    }
                    .padding()
                    .background(Color.black)
                    
                }
            }
            .edgesIgnoringSafeArea(.all)
        }

    }
}

struct TimerPage_Previews: PreviewProvider {
    
    static var previews: some View {
        TimerPage()
    }
}
