// - MARK: Imports
import SwiftUI

// - MARK: AddCalorie View
struct AddCalorieView: View {
    // - MARK: Environments
    @EnvironmentObject var menuObject: MenuClass
    @FocusState var isFocused: Bool
    @State var newCals = ""
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: menuObject.PopUpSize["width"], height: menuObject.PopUpSize["height"])
                .cornerRadius(30)
                .foregroundColor(CustomColors.popupBackground)
            
            VStack {
                Text("ADD CALORIES")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .font(.system(size: 40, weight: .heavy))
                    //.offset(x: -20)
                Text("How many calories did you eat?")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .medium))
                
                Spacer()
                    .frame(height: 20)
                
                HStack {
                    TextField("Caloric Amount", text: $newCals)
                        .frame(width: 250, height: 50, alignment: .center)
                        .multilineTextAlignment(.center)
                        .background(CustomColors.popupTextField)
                        .cornerRadius(50)
                        .foregroundColor(.white)
                        .keyboardType(.numberPad)
                        .focused($isFocused)
                        .onChange(of: isFocused, perform: { newValue in
                            if newValue {
                                menuObject.PopUpSize["y"] = 120.0
                            }
                        })
                    
                    Spacer()
                        .frame(width: 20)
                    
                    Button {
                        let df = DateFormatter()
                        df.dateFormat = "dd/MM/yyyy"
                        isFocused = false
                        menuObject.inputtedCalories += Int(newCals) ?? 0
                        menuObject.dailyKCalPercent = Double(menuObject.inputtedCalories) / 2500.0
                        menuObject.isCalorieAdder = false
                        menuObject.calorieAdderOpacity = 0
                        menuObject.PopUpSize["y"]! = menuObject.isCalorieAdder ? menuObject.PopUpSize["AnimHeight"]! : 610.0
                        menuObject.calorieDataArray[df.string(from: Date())] = menuObject.inputtedCalories
                        
                        do {
                            try UtilManager.saveData(data: menuObject.calorieDataArray, to: "CalorieDataTestV3.json")
                        } catch {
                            print("An error occurred: \(error)")
                        }
                        //menuObject.calorieDataArray?[Date()] = menuObject.inputtedCalories
                        //print(menuObject.calorieDataArray?[Date()] as Any)
                    } label: {
                        Image("Done_Icon")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .foregroundColor(.gray)
                    }
                }
            }
            .offset(y: -20)
        }
        .shadow(radius: 10)
        /*ZStack {
            Image("Background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .offset(y: -30)
                .zIndex(0)
            
            Rectangle()
                .background(.ultraThinMaterial)
                .foregroundColor(CustomColors.backdropAccentColor.opacity(0.35))
                .foregroundStyle(.ultraThinMaterial)
                .cornerRadius(10)
                .frame(width: 350, height: 200)
            
            VStack {
                Text("Input Calories")
                    .bold()
                    .foregroundColor(.white)
                    .font(.system(size: 30))
                    .offset(x: -65, y: 5)
                
                Spacer()
                    .frame(height: 80)
                
                TextField("Add Calories", text: $newCals)
                    .frame(width: 200, height: 35, alignment: .center)
                    .multilineTextAlignment(.center)
                    .background(.gray.opacity(0.35))
                    .cornerRadius(50)
                    .foregroundColor(.white)
                    .keyboardType(.numberPad)
                    .offset(y: 30)
                    .focused($isFocused)
                
                Button("SUBMIT") {
                    isFocused = false
                    self.menuObject.inputtedCalories += Int(newCals) ?? 0
                    self.menuObject.isCalorieAdder = false
                }
                .frame(width: 150, height: 35)
                .foregroundColor(.white)
                .bold()
                .background(.ultraThinMaterial)
                .foregroundColor(CustomColors.positiveColor.opacity(0.35))
                .foregroundStyle(.ultraThinMaterial)
                .cornerRadius(10)
                .offset(y: 60)
                
            }
        }*/
    }
}

// - MARK: Preview Provider
struct AddCalorieView_Previews: PreviewProvider {
    static var previews: some View {
        AddCalorieView()
            .environmentObject(MenuClass())
    }
}
