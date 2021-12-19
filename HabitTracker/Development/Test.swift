//
//  Test.swift
//  Test
//
//  Created by Mason Dierkes on 10/19/21.
//

import SwiftUI

struct Test: View {

    @Binding var progress: CGFloat

    var outlineColor: Color = .outlineRed;
    var darkColor: Color = .darkRed;
    var lightColor: Color = .lightRed;
    var ringWidth: CGFloat = 40

    var body: some View {
        Text("Test")
    }
    

}

struct Test_Previews: PreviewProvider {
    @State static private var progress: CGFloat = 0.7
    static var previews: some View {
        Test(progress: $progress, ringWidth: 15)
            .frame(width: 115, height: 115)
        
    }
}

