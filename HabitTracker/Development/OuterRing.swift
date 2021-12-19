//
//  OuterRing.swift
//  HabitTracker
//
//  Created by Mason Dierkes on 10/20/21.
//

import SwiftUI

struct OuterRing: View {

    @Binding var progress: CGFloat

    var outlineColor: Color = .outlineRed;
    var darkColor: Color = .darkRed;
    var lightColor: Color = .lightRed;
    var ringWidth: CGFloat = 40

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Circle()
                    .stroke(self.outlineColor, lineWidth: self.ringWidth)
                Circle()
                    .trim(from: 0, to: self.progress)
                    .stroke(
                        AngularGradient(
                            gradient: Gradient(colors: self.colors),
                            center: .center,
                            startAngle: .degrees(0),
                            endAngle: .degrees(360)
                            
                        ),
                        style: StrokeStyle(lineWidth: self.ringWidth, lineCap: .round)
                        
                ).rotationEffect(.degrees(
                    self.fullCircle
                        ? 270 + 360*Double(self.progress) - 360
                        : 270))
                

                Circle()
                    .frame(width:self.ringWidth, height: self.ringWidth)
                    .offset(y: -geometry.size.height / 2)
                    .foregroundColor(
                        self.touching
                            ? self.lightColor
                            : Color.clear)
                    .shadow(color: Color.black.opacity(0.5),
                            radius: 1.5, x:5)
                    .rotationEffect(
                        .degrees(360 * Double(self.progress)))
                
            }
            .frame(idealWidth: 200, idealHeight:200, alignment: .center)
        }
    }
    
    private var colors : [Color] {
        [darkColor, lightColor]
    }
    
    private var touching: Bool {
        progress > 0.95
    }
    
    private var fullCircle: Bool {
        progress >= 1
    }

}

struct OuterRing_Previews: PreviewProvider {
    @State static private var progress: CGFloat = 0.7
    static var previews: some View {
        Test(progress: $progress, ringWidth: 15)
            .frame(width: 115, height: 115)
        
    }
}


extension Color {
    
    public static var outlineRed: Color {
        return Color(decimalRed: 49, green: 4, blue: 16)
    }
    
    public static var darkRed: Color {
        return Color(decimalRed: 247, green: 27, blue: 83)
    }
    
    public static var lightRed: Color {
        return Color(decimalRed: 246, green: 61, blue: 134)
    }
    
    public static var outlineBlue: Color {
        return Color(decimalRed: 7, green: 58, blue: 54)
    }
    
    public static var darkBlue: Color {
        return Color(decimalRed: 37, green: 216, blue: 253)
    }
    
    public static var lightBlue: Color {
        return Color(decimalRed: 42, green: 252, blue: 169)
    }
    
    public static var outlineGreen: Color {
        return Color(decimalRed: 34, green: 50, blue: 4)
    }
    
    public static var darkGreen: Color {
        return Color(decimalRed: 156, green: 253, blue: 50)
    }
    
    public static var lightGreen: Color {
        return Color(decimalRed: 215, green: 252, blue: 53)
    }
    
    public init(decimalRed red: Double, green: Double, blue: Double) {
        self.init(red: red / 255, green: green / 255, blue: blue / 255)
    }
}

