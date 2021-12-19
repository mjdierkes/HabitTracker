//
//  Group.swift
//  Group
//
//  Created by Mason Dierkes on 10/6/21.
//

import Foundation

public struct Group : Identifiable{
    
    public var id = UUID()
    
    var name: String
    var people: [String]
    
    
}
