//
//  RegisterView.swift
//  CalorieApp_V1_SwiftUI
//
//  Created by William Blake Lawson on 11/23/22.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var menuObject: MenuClass
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var gender: String = ""
    @State var pronouns: String = ""
    @State var height: Float = 172
    @State var weight: Float = 45
    @State var units: String = "metric"
    @State var submit: Bool = false
    let UtilManager = UtilityManager()
    
    var body: some View {
        NavigationView {
            Form {
                Section (header: Text("Name")) {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                }
                Section (header: Text("Gender")) {
                    Picker(selection: $gender, label:Text("Gender")) {
                        Text("Male").tag("male")
                        Text("Female").tag("female")
                        Text("Non-Binary").tag("nonBinary")
                    }
                    TextField("Pronouns", text: $pronouns)
                }
                Section (header: Text("Units")) {
                    Picker(selection: $units, label:Text("Unit Measurements")) {
                        Text("Metric").tag("metric")
                        Text("Imperial").tag("imperial")
                    }
                }
                Section (header: Text("BMI")) {
                    
                    if units == "metric" {
                        Stepper("Height (\(height.rounded(.towardZero).formatted()))",
                                value: $height,
                                in: 137.16...205.74)
                        
                        Stepper("Weight (\(weight.formatted()))",
                                value: $weight,
                                in: 45...200)
                    } else {
                        let heightArray = inchesToFeet(x: height)
                        Stepper("Height (\(heightArray[0])' \(heightArray[1])\")",
                                value: $height,
                                in: 137.16...205.74, step: 3)
                        
                        Stepper("Weight (\((weightToImperial(x: weight).rounded(.towardZero).formatted())))", value: $weight, in: 45...200, step: 0.5)
                    }
                }
                Section (){
                    Button() {
                        menuObject.isReg = false
                        menuObject.regOffset["x"] = 500
                        menuObject.profileDataArray["FirstName"] = firstName
                        menuObject.profileDataArray["LastName"] = lastName
                        menuObject.profileDataArray["Gender"] = gender
                        menuObject.profileDataArray["pronouns"] = pronouns
                        menuObject.profileDataArray["height"] = String(height)
                        menuObject.profileDataArray["weight"] = String(weight)
                        menuObject.profileDataArray["units"] = units
                        menuObject.profileDataArray["DailyNecessaryCalories"] = String(UtilManager.calculateCalorieNeeds(weight: Double(menuObject.profileDataArray["weight"]!)!, height: Double(menuObject.profileDataArray["height"]!)!, age: 23, gender: menuObject.profileDataArray["Gender"]!, activityLevel: "sedentary"))
                        
                        do {
                            try UtilManager.saveData(data: menuObject.profileDataArray, to: "AppDataTestV4.json")
                        } catch {
                            print("An error occurred: \(error)")
                        }
                    } label: {
                        Text("Create Profile")
                            .foregroundColor(.orange)
                    }
                }
            }
            .navigationTitle("Create Profile")
        }
    }
    
    func inchesToFeet(x: Float) -> Array<Int> {
        let totalInches = x*0.393701
        let feet = (totalInches.rounded(.towardZero)/12).rounded(.towardZero)
        let inches = totalInches-(feet * 12)
        let height = [Int(feet), Int(inches)]
        return height
    }
    
    func weightToImperial(x: Float) -> Float {
        return x*2.205
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView().preferredColorScheme(.dark)
            .environmentObject(MenuClass())
    }
}
