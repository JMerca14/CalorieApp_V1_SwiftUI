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
        }
    }
}

// - MARK: Preview Provider
struct AddCalorieView_Previews: PreviewProvider {
    static var previews: some View {
        AddCalorieView()
            .environmentObject(MenuClass())
    }
}
