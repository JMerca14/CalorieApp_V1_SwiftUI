//
//  SideMenuView.swift
//  CalorieApp_V1_SwiftUI
//
//  Created by William Blake Lawson on 11/15/22.
//

import SwiftUI

struct SideMenuView: View {
    @Binding var menuIsShowing: Bool
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("MenuBackgroundLight"), Color("MenuBackgroundDark")]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                //Header
                SideMenuHeaderView(menuIsShowing: $menuIsShowing)
                    .foregroundColor(.white)
                    .frame(height: 240)
                
                //Items
                ForEach(SideMenuViewModel.allCases, id: \.self) { item in
                    NavigationLink(destination: item.destination, label: {SideMenuItemView(viewModel: item)
                    })
                }
                
                Spacer()
            }
        }.navigationBarHidden(true)
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView(menuIsShowing: .constant(true))
    }
}

