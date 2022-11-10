//
//  MenuBar.swift
//  CalorieApp_V1_SwiftUI
//
//  Created by Juan Mercado on 11/7/22.
//

import SwiftUI

struct MenuBarView: View {
    @EnvironmentObject var menuObject: MenuClass
    
    var body: some View {
        ZStack (alignment: .center){
            Image("Home_Icon")
                .resizable()
                .frame(width: 300, height: 150)
                .foregroundColor(CustomColors.backdropAccentColor)
            
            NavigationLink(destination: AddCalorieView()) {
                Image("Logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .shadow(color: .black, radius: 5, x: 0, y: 5)
                    .padding(.bottom, 25)
            }
            .zIndex(2)
        }
        /*ZStack {
            Spacer()
            
            VStack {
                Button {
                    print("Test")
                } label: {
                    Image("Logo")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .shadow(color: .black, radius: 5, x: 0, y: 5)
                }
                .offset(y: 20)
                .zIndex(2)
                
                ZStack {
                    Image("Bar")
                        .offset(y: -15)
                    
                    HStack {
                        /*Button {
                            print("Home button pressed")
                            self.menuObject.isHome = true
                            self.menuObject.isShowing = false
                        } label: {
                            Image("Home_Button")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .shadow(color: .black, radius: 2, x: 0, y: 2)
                                .foregroundColor(self.menuObject.isHome ? CustomColors.accentColor : .gray)
                        }
                        .offset(y: -25)*/
                        
                        NavigationLink(destination: ContentView().navigationBarBackButtonHidden(false), isActive: .constant(false)) {
                            Image("Home_Button")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .shadow(color: .black, radius: 2, x: 0, y: 2)
                                .foregroundColor(self.menuObject.isHome ? CustomColors.accentColor : .gray)
                                .offset(y: -25)
                                .zIndex(1)
                        }
                        
                        Spacer()
                            .frame(width: 200)
                        
                        NavigationLink(destination: ProgView().navigationBarBackButtonHidden(true), isActive: $menuObject.isShowing) {
                            Image("Progress_Button")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .shadow(color: .black, radius: 2, x: 0, y: 2)
                                .foregroundColor(self.menuObject.isHome ? .gray : CustomColors.accentColor)
                                .offset(y: -25)
                                .zIndex(1)
                        }
                    }
                }
                .zIndex(1)
            }
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
        .onAppear{
            if self.menuObject.isShowing {
                print("IsShowing: True")
            } else {
                print("IsShowing: False")
            }
            
            if self.menuObject.isHome {
                print("IsHome: True")
            } else {
                print("IsHome: False")
            }
        }*/
    }
}

struct MenuBar_Previews: PreviewProvider {
    static var previews: some View {
        MenuBarView()
            //.environmentObject(MenuClass())
    }
}
