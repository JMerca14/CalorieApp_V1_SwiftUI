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
            HStack {
                Text("74")
                    .foregroundColor(Color.white)
                    .padding(.leading, 5)
                Image("match")
                    .resizable()
                    .frame(width: 35, height: 35, alignment: .center)
                    .padding(.top, 10)
                    .padding(.leading, -10)
            }
            .frame(width: 75, height: 35)
            .background(Color("Backdrop").opacity(0.8))
            .clipShape(
                RoundedRectangle(cornerRadius: 20)
            )
            
        }
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header(menuIsShowing: .constant(true), title: "Dashboard")
    }
}
