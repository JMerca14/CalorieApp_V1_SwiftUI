//
//  Card.swift
//  CalorieApp_V1_SwiftUI
//
//  Created by William Blake Lawson on 11/9/22.
//

import SwiftUI

struct Card: View {
    
    var title: String = "Title"
    var caption: String = "Caption"
    
    var body: some View {
        GeometryReader { geo in
            RoundedRectangle(cornerRadius: 10)
                .fill(Color("Card Background"))
            VStack (alignment: .leading){
                VStack (alignment: .leading) {
                    Text(title) //"\(Int(calories)) Kcal"
                        .font(.headline)
                        .multilineTextAlignment(.leading)
                        .lineLimit(0)
                        .foregroundColor(Color.white)
                    
                    Text(caption) //Calorie Intake
                        .font(.subheadline)
                        .foregroundColor(Color.gray.opacity(0.75))
                }.padding()
                HStack (alignment: .center) {
                    Spacer()
                    CircularProgressBar(value: 0.56).padding()
                    Spacer()
                }
            }
        }
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(title: "549 KCal(s)", caption: "Today's input")
    }
}
