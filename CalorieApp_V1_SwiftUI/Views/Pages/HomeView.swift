//
//  HomeView.swift
//  CalorieApp_V1_SwiftUI
//
//  Created by William Blake Lawson on 11/9/22.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var menuObject: MenuClass
    var body: some View {
        ScrollView {
            
            //Streak Card
            ZStack {
                Rectangle()
                    .background(.ultraThinMaterial)
                    .foregroundColor(CustomColors.backdropAccentColor.opacity(0.8))
                    .foregroundStyle(.ultraThinMaterial)
                    .cornerRadius(10)
                    .frame(height: 150)
                    .opacity(0.8)
                    .zIndex(0)
                
                VStack {
                        VStack {
                            Text("17 Day Streak!")
                                .foregroundColor(.orange)
                                .bold()
                                .font(.largeTitle)
                            
                            Text("Set your goals ablaze.")
                                .foregroundColor(.white)
                                .bold()
                                .font(.title)
                        }
                        Spacer()
                    
                }
                .frame(height: 150)
                .padding(.top, 60)
            }
            
            //Level Card
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
                            Text("Level 14")
                                .foregroundColor(.white)
                                .bold()
                                .font(.title)
                                .padding()
                            Text("Current Level")
                                .foregroundColor(.gray)
                                .font(.callout)
                                .padding()
                                .padding(.top, -30)
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(Color.orange)
                                    .frame(width: 275, height: CGFloat(20))
                                    .padding(.horizontal, 15)
                            }
                            Text("1475/1500")
                                .padding(.horizontal, 15)
                                .foregroundColor(.white)
                            
                        }
                        Spacer()
                    }
                    Spacer()
                }
                
            }
            .frame(height: 150)
            .padding(.top, 5)
            
            Spacer(minLength: 30)
            
            //Quote Card
            ZStack (alignment: .center){
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
                            Text("Calories from protein affect your brain, your appetite control center, so you are more satiated and satisfied.")
                                .foregroundColor(.white)
                                .bold()
                                .font(.title3)
                                .padding()
                            Text("- Mark Hyman")
                                .foregroundColor(.gray)
                                .font(.callout)
                                .padding()
                                .padding(.top, -30)
                            
                        }
                        Spacer()
                    }
                    Spacer()
                }
                
            }
            .frame(height: 150)
            .padding(.top, 25)
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
