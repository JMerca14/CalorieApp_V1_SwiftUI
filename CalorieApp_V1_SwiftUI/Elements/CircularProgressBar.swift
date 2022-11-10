//
//  CircularProgressBar.swift
//  CalorieApp_V1_SwiftUI
//
//  Created by William Blake Lawson on 11/9/22.
//

import SwiftUI

struct CircularProgressBar: View {
    var value: Double
    var body: some View {
        let customGradient = AngularGradient(
            gradient: Gradient(colors: [Color.yellow, .orange]),
            center: .center,
            startAngle: .degrees(0),
            endAngle: .degrees(365 * Double(value)))
        
        ZStack {
            Circle()
                .stroke (
                    customGradient.opacity(0.1),
                    lineWidth: 15
                )
            Circle()
                .trim(from: 0, to: value)
            
                .stroke(
                    customGradient,
                    style:
                        StrokeStyle(
                            lineWidth: 15,
                            lineCap: .round)
                )
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut, value: value)
            
            Text("\(Int(100*value))%")
                .font(.headline)
                .foregroundColor(Color.white)
        }
    }
}

struct CircularProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressBar(value: 0.56)
    }
}
