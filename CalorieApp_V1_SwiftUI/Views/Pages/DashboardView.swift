//
//  DashboardView.swift
//  CalorieApp_V1_SwiftUI
//
//  Created by William Blake Lawson on 11/17/22.
//

import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var menuObject: MenuClass
    var body: some View {
        ZStack {
            Image("Background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack {
                    // Medium Card
                    ZStack {
                        Rectangle()
                            .background(.ultraThinMaterial)
                            .foregroundColor(CustomColors.backdropAccentColor.opacity(0.8))
                            .foregroundStyle(.ultraThinMaterial)
                            .cornerRadius(10)
                            .frame(height: 180)
                            .opacity(0.8)
                            .zIndex(0)
                        
                        VStack {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Medium Card")
                                        .foregroundColor(.white)
                                        .bold()
                                        .font(.system(size: 20))
                                        .padding()
                                }
                                Spacer()
                            }
                            Spacer()
                        }
                        
                    }
                    .frame(height: 180)
                    // Big Card
                    ZStack {
                        Rectangle()
                            .background(.ultraThinMaterial)
                            .foregroundColor(CustomColors.backdropAccentColor.opacity(0.8))
                            .foregroundStyle(.ultraThinMaterial)
                            .cornerRadius(10)
                            .frame(height: 360)
                            .opacity(0.8)
                            .zIndex(0)
                        
                        VStack (alignment: .leading){
                            NavigationLink(destination: ProgressViewNew()) {
                                let calories = [
                                    Calorie(count: 1149, day: "S"),
                                    Calorie(count: 1750, day: "M"),
                                    Calorie(count: 2150, day: "T"),
                                    Calorie(count: 650, day: "W"),
                                    Calorie(count: 1000, day: "T"),
                                    Calorie(count: 1250, day: "F"),
                                    Calorie(count: 1850, day: "S")
                                ]
                                BarGraph(data: calories)
                                    .frame(alignment: .center)
                                    .padding(.top, -25)
                                    .padding(.horizontal, 15)
                            }
                            .frame(alignment: .center)
                        }
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        
                    }
                    .frame(height: 360)
                    .padding(.top, 20)
                    
                    // Small Cards
                    HStack {
                        ZStack {
                            Rectangle()
                                .background(.ultraThinMaterial)
                                .foregroundColor(CustomColors.backdropAccentColor.opacity(0.8))
                                .foregroundStyle(.ultraThinMaterial)
                                .cornerRadius(10)
                                .opacity(0.8)
                            
                            VStack {
                                VStack(alignment: .leading) {
                                    Text("\(menuObject.inputtedCalories) KCal(s)")
                                        .foregroundColor(.white)
                                        .bold()
                                        .font(.system(size: 20))
                                    
                                    Text("Today's KCal Intake")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 15))
                                }
                                
                                Spacer()
                                    .frame(height: 25)
                                
                                CircularProgressBar(value: Double(menuObject.dailyKCalPercent)).frame(width: 100, height: 100)
                                    .padding(15)
                                
                                
                            }
                            .padding(10)
                        }
                        
                        Spacer()
                            .frame(width: 20)
                        
                        ZStack {
                            Rectangle()
                                .background(.ultraThinMaterial)
                                .foregroundColor(CustomColors.backdropAccentColor.opacity(0.8))
                                .foregroundStyle(.ultraThinMaterial)
                                .cornerRadius(10)
                                .opacity(0.8)
                            
                            VStack {
                                VStack(alignment: .leading) {
                                    Text("\(menuObject.inputtedCalories) KCal(s)")
                                        .foregroundColor(.white)
                                        .bold()
                                        .font(.system(size: 20))
                                    
                                    Text("Today's KCal Intake")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 15))
                                }
                                
                                Spacer()
                                    .frame(height: 25)
                                
                                CircularProgressBar(value: Double(menuObject.dailyKCalPercent)).frame(width: 100, height: 100)
                                    .padding(15)
                                
                                
                            }
                            .padding(10)
                        }
                    }
                    .padding(.top, 20)
                    
                    // Medium Card
                    ZStack {
                        Rectangle()
                            .background(.ultraThinMaterial)
                            .foregroundColor(CustomColors.backdropAccentColor.opacity(0.8))
                            .foregroundStyle(.ultraThinMaterial)
                            .cornerRadius(10)
                            .frame(height: 180)
                            .opacity(0.8)
                            .zIndex(0)
                        
                        VStack {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Medium Card")
                                        .foregroundColor(.white)
                                        .bold()
                                        .font(.system(size: 20))
                                        .padding()
                                }
                                Spacer()
                            }
                            Spacer()
                        }
                        
                    }
                    .frame(height: 180)
                    .padding(.top, 20)
                }
            }
            .padding()
            .padding(.top, 50)
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
