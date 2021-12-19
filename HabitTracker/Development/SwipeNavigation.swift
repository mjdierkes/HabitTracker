//
//  SwipeNavigation.swift
//  SwipeNavigation
//
//  Created by Mason Dierkes on 10/6/21.
//

import SwiftUI


enum currentView {
    case center
    case left
    case right
}


let screenSize = UIScreen.main.bounds
let screenWidth = screenSize.width
let screenHeight = screenSize.height

import SwiftUI

struct SwipeNavigation: View {
    @State var activeView = currentView.center
    @State var viewState = CGSize.zero
    
    @ObservedObject private var model = TrackerModel()
    
    var body: some View {
        
        ZStack(alignment: .bottom){
            ZStack {
                
                HomePage()
                    .environmentObject(model)
                LeftView()
                    .offset(x: self.activeView == currentView.left ? 0 : -screenWidth)
                    .offset(x: activeView != .right ? viewState.width : 0)
                    .animation(.easeInOut)
                    .environmentObject(model)
                
                
                TimerPage()
                    .offset(x: self.activeView == currentView.right ? 0 : screenWidth)
                    .offset(x: activeView != .left ? viewState.width : 0)
                    .animation(.easeInOut)
                    .environmentObject(model)
                
            }
            
            HStack(spacing: 40){
                Spacer()
                VStack{
                    Image(systemName: "person.2")
                        .foregroundColor(activeView == currentView.left ? Color.blue : Color.black)
                        .scaleEffect(0.9)
                    Text("Groups")
//                        .bold()
                }
                //
                .onTapGesture {
                    withAnimation(.none) {
                        self.activeView = currentView.left
                    }
                    
                }
                
                VStack{
                    Image(systemName: "checkmark.circle")
                        .foregroundColor(activeView == currentView.center ? Color.purple : Color.black)
                        .scaleEffect(1.3)
                    Text("Tasks")
//                        .bold()
                    
                        .onTapGesture {
                            self.activeView = currentView.center
                        }
                }
            
                
                
                VStack{
                    Image(systemName: "timer")
                    //                    .foregroundColor(activeView == currentView.right ? Color.blue : Color.black)                    .scaleEffect(1.3)
                    //                    .padding()
                    Text("Timer")
//                        .bold()
                        .onTapGesture {
                            self.activeView = currentView.right
                        }
                }
                //
                
                Spacer()
            }
            
            .padding(25)
            .background(Color.white)
            //            .blur(radius: 2)
            //            .cornerRadius(12)
            //            .padding()
            
            
        }
        .edgesIgnoringSafeArea(.bottom)
        
        
        .gesture(
            
            (self.activeView == currentView.center) ?
            
            DragGesture().onChanged { value in
                
                self.viewState = value.translation
                
            }
                .onEnded { value in
                    if value.predictedEndTranslation.width > screenWidth / 2 {
                        self.activeView = currentView.left
                        self.viewState = .zero
                        
                    }
                    else if value.predictedEndTranslation.width < -screenWidth / 2 {
                        self.activeView = currentView.right
                        self.viewState = .zero
                    }
                    
                    else {
                        self.viewState = .zero
                    }
                    
                }
            : DragGesture().onChanged { value in
                switch self.activeView {
                case .left:
                    guard value.translation.width < 1 else { return }
                    self.viewState = value.translation
                case .right:
                    guard value.translation.width > 1 else { return }
                    self.viewState = value.translation
                case.center:
                    self.viewState = value.translation
                    
                }
                
            }
            
                .onEnded { value in
                    switch self.activeView {
                    case .left:
                        if value.predictedEndTranslation.width < -screenWidth / 2 {
                            self.activeView = .center
                            self.viewState = .zero
                        }
                        else {
                            self.viewState = .zero
                        }
                    case .right:
                        if value.predictedEndTranslation.width > screenWidth / 2 {
                            self.activeView = .center
                            self.viewState = .zero
                        }
                        else {
                            self.viewState = .zero
                        }
                    case .center:
                        self.viewState = .zero
                        
                    }
                }
        )
    }
    
}



struct SwipeNavigation_Previews: PreviewProvider {
    static var previews: some View {
        SwipeNavigation()
    }
}
