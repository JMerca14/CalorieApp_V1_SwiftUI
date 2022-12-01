//
//  RegisterView.swift
//  CalorieApp_V1_SwiftUI
//
//  Created by William Blake Lawson on 11/23/22.
//

import SwiftUI

struct RegisterView: View {
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var gender: String = ""
    @State var pronouns: String = ""
    @State var height: Float = 172
    @State var weight: Float = 45
    @State var units: String = "metric"
    @State var submit: Bool = false
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
                        Stepper("Height (\(height.formatted()))",
                                value: $height,
                                in: 137.16...205.74)
                        
                        Stepper("Weight (\(weight.formatted()))",
                                value: $weight,
                                in: 45...200)
                    } else {
                        Stepper("Height (\(heightToImperial(x: height)))",
                                value: $height,
                                in: 137.16...205.74)
                        
                        Stepper("Weight (\((weightToImperial(x: weight).rounded(.towardZero).formatted())))", value: $weight, in: 45...200, step: 0.5)
                    }
                }
                Section {
                    Button(action: { self.submit.toggle() }) {
                            Text("Create Profile")
                        
                        //Need to create func that adds user defaults and goes to dashboard 
                    }
                }
            }
            .navigationTitle("Create Profile")
        }
    }
    func heightToImperial(x: Float) -> Float{
        return (x/2.54)/12
    }
    func weightToImperial(x: Float) -> Float {
        return x*2.205
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}