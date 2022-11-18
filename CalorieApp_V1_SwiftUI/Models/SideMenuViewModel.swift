//
//  SideMenuViewModel.swift
//  CalorieApp_V1_SwiftUI
//
//  Created by William Blake Lawson on 11/15/22.
//

import Foundation
import SwiftUI

enum SideMenuViewModel: Int, CaseIterable {
    case dashboard
    case progress
    case profile
    case settings
    case logout
    
    var title: String {
        switch self {
        case .dashboard: return "Dashboard"
        case .progress: return "Progress"
        case .profile: return "Profile"
        case .settings: return "Settings"
        case .logout: return "Log Out"
        }
    }
        
    var imageName: String {
        switch self {
        case .dashboard: return "circle.square"
        case .progress: return "chart.xyaxis.line"
        case .profile: return "person"
        case .settings: return "gearshape"
        case .logout: return "arrow.left.square"
        }
    }
    
    var destination: some View {
        switch self {
            case .dashboard: return AnyView(DashboardView())
            case .progress: return AnyView(ProgressViewNew())
            case .profile: return AnyView(ProfileView())
            case .settings: return AnyView(HomeView())
            case .logout: return AnyView(HomeView())
        }
    }

}
