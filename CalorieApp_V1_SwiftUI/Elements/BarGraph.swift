//
//  BarGraph.swift
//  CalorieApp_V1_SwiftUI
//
//  Created by William Blake Lawson on 11/9/22.
//

import SwiftUI

struct BarGraph: View {
    let data: [Calorie]
    
    // MARK: -Labels
    // Dynamic based on Calories Passed In
    
    var averageCalories: CGFloat {
        data.map { $0.count }.reduce(0.0){$0 + CGFloat($1)}/CGFloat(data.count)
    }
    
    var topLabel: Int {
        let value: Float = Float(data.map {$0.count}.max()! + 100)
        let multiples: Float = 200
        
        return Int(((value / multiples).rounded(.up)) * multiples)
    }
    
    struct layeredLabel: Identifiable {
        let id = UUID()
        let value: Int
    }
    
    var labels: [layeredLabel] {
        let labelOne: Int = topLabel
        let labelFive: Int = 0
        let labelThree: Int = topLabel/2
        let labelFour: Int = labelThree/2
        let labelTwo: Int = labelThree + labelFour
        
        return [layeredLabel(value: labelOne), layeredLabel(value: labelTwo), layeredLabel(value: labelThree), layeredLabel(value: labelFour), layeredLabel(value: labelFive)]
    }
    // MARK: -View
    var body: some View {
        let graphLabels = labels
        ZStack {
            VStack { // Container
                //Header
                HStack {
                    VStack (alignment: .leading){ // Header Text
                        Text("\(Int(averageCalories)) Kcal(s)")
                            .foregroundColor(Color.white)
                            .font(.title3)
                            .bold()
                        Text("Daily Average Calorie Intake")
                            .font(.body)
                            .foregroundColor(Color.gray)
                    }
                    Spacer()
                    
                    Image(systemName: "chevron.forward")
                        .foregroundColor(.white)
                }
                .padding(.bottom, 20)
                //.padding(.horizontal, 0)
                //.padding(.top, 0)
                // Graph
                HStack {
                    // Labels
                    VStack (alignment: .trailing, spacing: 30){
                        ForEach (graphLabels) {
                            label in
                            Text(String(label.value)).foregroundColor(Color.gray)
                        }
                    }.padding(.top, -30).padding(.trailing, 15)
                    //Chart
                    HStack (alignment: .lastTextBaseline) {
                        
                        ForEach(data, id: \.id) { calorie in
                            
                            let yValue = Swift.min(calorie.count/10, 200)
                            VStack {
                                
                                RoundedRectangle(cornerRadius: 5)
                                    .fill((Int(calorie.count) >= Int(averageCalories)) ? Color.orange : Color.gray) //change orange to gradient
                                    .frame(width: 20, height: CGFloat(yValue))
                                    .padding(.horizontal, 5)
                                
                                Text("\(calorie.day)")
                                    .foregroundColor(Color.gray)
                                    .font(.body)
                            }
                        }
                    }
                    .frame(height: 200)
                    .padding(.top, 20)
                    .padding(.leading, -8)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.horizontal, -100)
                .zIndex(0)
            }
            
            // Average Line Indicator
            Rectangle()
                .strokeBorder(.gray, style: StrokeStyle(lineWidth: 3, dash: [5]))
            // Change Stoke Color
                .frame(width: 250, height: 3)
                .offset(x: 25)
                .offset(y: (145 - averageCalories/10))
                .zIndex(1)
        }
    }
}

struct BarGraph_Previews: PreviewProvider {
    static var previews: some View {
        let calories = [
                        Calorie(count: 1210, day: "S"),
                        Calorie(count: 1610, day: "M"),
                        Calorie(count: 2000, day: "T"),
                        Calorie(count: 1900, day: "W"),
                        Calorie(count: 1000, day: "T"),
                        Calorie(count: 1000, day: "F"),
                        Calorie(count: 1452, day: "S")
        ]
        BarGraph(data: calories)
    }
}
