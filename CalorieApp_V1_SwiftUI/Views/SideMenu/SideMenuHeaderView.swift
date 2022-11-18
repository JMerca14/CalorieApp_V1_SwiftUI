//
//  SideMenuHeaderView.swift
//  CalorieApp_V1_SwiftUI
//
//  Created by William Blake Lawson on 11/15/22.
//

import SwiftUI

struct SideMenuHeaderView: View {
    @Binding var menuIsShowing: Bool
    var body: some View {
        ZStack (alignment: .topTrailing) {
            
            Button(action: {withAnimation(.spring()) {
                menuIsShowing.toggle()
            }}, label: {
                Image(systemName: "xmark")
                    .frame(width: 32, height: 32)
                    .padding()
            })
            VStack(alignment: .leading) {
                Image("PFP")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
                    .padding(.bottom, 16)
                
                Text("Jane Doe") //Name
                    .font(.system(size: 24, weight: .semibold))
                
                Text("@Jane93")
                    .font(.system(size: 14))
                
                HStack(spacing: 12) {
                    HStack(spacing: 4){
                        Text("17").bold().foregroundColor(Color("Accent"))
                        Text("Day Streak").foregroundColor(Color("Accent"))
                    }
                    Spacer()
                }
                .padding(.top, 32)
                
                Spacer()
                
            }
            .padding()
        }
    }
}

struct SideMenuHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuHeaderView(menuIsShowing: .constant(true))
    }
}

