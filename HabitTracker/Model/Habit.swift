//
//  Habit.swift
//  Habit
//
//  Created by Mason Dierkes on 9/22/21.
//

import Foundation
import SwiftUI

public struct Habit: Identifiable {
    public var id = UUID()
    
    public var name: String
    public var imageName: String

    public var measurementDuration: Int = 1
    
    
    public var streak: Int = 0
    public var isCompleted = false
    public var completions: [Date: Bool] = [Date(): true]

    public var type: HabitType = HabitType.completion
    public var segments: Int = 0
    public var completionAmount: CGFloat = 0
}

public enum HabitType {
    case segmented
    case duration
    case completion
}
