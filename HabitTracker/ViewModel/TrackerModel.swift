//
//  TrackerModel.swift
//  TrackerModel
//
//  Created by Mason Dierkes on 9/22/21.
//

import Foundation


public final class TrackerModel: ObservableObject {
    
    @Published public var habits : [Habit] = [Habit(name: "Feed Dog", imageName: "Lifting-Weights")]
    @Published public var groups : [Group] = [Group(name: "XC 2021", people: ["Mason", "Will", "Chad"])]
        
    

    
    
    
    public init(){
        
    }

    
    
}
