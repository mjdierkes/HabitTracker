//
//  TabViewModel.swift
//  TabViewModel
//
//  Created by Mason Dierkes on 10/18/21.
//

import SwiftUI

class TabBarViewModel: ObservableObject {
    @Published var tab = 2
    @Published var position: CGFloat = 0
    let tabBarViewHeight: CGFloat = 70
}
