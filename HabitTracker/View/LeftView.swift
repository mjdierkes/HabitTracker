//
//  LeftView.swift
//  LeftView
//
//  Created by Mason Dierkes on 10/6/21.
//

import SwiftUI

struct LeftView: View {
    
    @EnvironmentObject var model: TrackerModel
    
    var body: some View {
        GeometryReader { g in
            ScrollView(.horizontal){
                Text("header")
                List {
                    ForEach(model.groups) { group in
                        Text(group.name)
                    }
                    .onDelete { index in
                        // delete item
                    }
                }.frame(width: g.size.width - 5, height: g.size.height - 50, alignment: .center)
            }
        }
    }
}

struct LeftView_Previews: PreviewProvider {
    static var previews: some View {
        LeftView()
    }
}
