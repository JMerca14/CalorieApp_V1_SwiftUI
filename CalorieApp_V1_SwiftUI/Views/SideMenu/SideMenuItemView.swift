//
//  SideMenuItemView.swift
//  CalorieApp_V1_SwiftUI
//
//  Created by William Blake Lawson on 11/15/22.
//

import SwiftUI


struct SideMenuItemView: View {
    let viewModel: SideMenuViewModel
    var body: some View {
        HStack (spacing: 16) {
            Image(systemName: viewModel.imageName)
                .frame(width: 24, height: 24)
            
            Text(viewModel.title)
                .font(.system(size: 15, weight: .semibold))
            
            Spacer()
        }
        .padding()
        .foregroundColor(.white)
    }
}

struct SideMenuItemView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuItemView(viewModel: .profile)
    }
}

