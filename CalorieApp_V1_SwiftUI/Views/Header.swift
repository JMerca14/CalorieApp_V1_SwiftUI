//
//  Header.swift
//  CalorieApp_V1_SwiftUI
//
//  Created by William Blake Lawson on 11/9/22.
//

import SwiftUI

struct Header: View {
    @Binding var menuIsShowing: Bool
    var title: String
    var body: some View {
        HStack {
            
            Button(action: {
                withAnimation(.spring()) {
                    menuIsShowing.toggle()
                }
            }) {
                Image("Menu_Button")
                Text(title)
                    .multilineTextAlignment(.leading)
                    .lineLimit(1)
                    .bold()
                    .foregroundColor(.white)
                    .font(.title3)
            }
            
            Spacer()
            
            NavigationLink(destination: ProfileView()){
                Button(action: {
                    
                }) {
                    Image("PFP")
                        .resizable()
                        .frame(width: 35, height: 35)
                }
            }
        }
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header(menuIsShowing: .constant(true), title: "Dashboard")
    }
}
