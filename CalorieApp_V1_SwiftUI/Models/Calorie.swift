//
//  TrackedCalories.swift
//  CalorieApp_V1_SwiftUI
//
//  Created by William Blake Lawson on 11/9/22.
//

import Foundation

struct Calorie: Identifiable {
    let id = UUID()
    let count: Int
    let day: String
}
