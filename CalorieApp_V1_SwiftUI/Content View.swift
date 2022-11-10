// - MARK: Imports
import SwiftUI

// - MARK: Structs
struct CustomColors {
    static let backdropColor = Color("Background")
    static let accentColor = Color("Accent")
    static let negativeColor = Color("Negative")
    static let positiveColor = Color("Positive")
    static let warningColor = Color("Warning")
    static let backdropAccentColor = Color("Backdrop")
}

// - MARK: Classes
class MenuClass : ObservableObject {
    @Published var isHome = true
    @Published var isShowingProgress = false
    @Published var isShowingProfile = false
    @Published var isCalorieAdder = false
    
    @Published var inputtedCalories = UserDefaults.standard.integer(forKey: "DailyKCal")
    @Published var dailyKCalPercent = 0.0
    @Published var curDate = UserDefaults.standard.object(forKey: "curDate") ?? Date()
}


// - MARK: Content View
struct ContentView: View {
    // - MARK: Observable Objects
    @ObservedObject var menuObject = MenuClass()
    var body: some View {
        NavigationView {
            ZStack {
                Image("Background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .zIndex(0)
                VStack {
                    // HEADER
                    Header(title: "Dashboard")
                        .padding(.bottom, 10)
                    // Home
                    HomeView()
                    
                }
                .padding(.vertical, 50)
                .padding(.horizontal, 30)
                .edgesIgnoringSafeArea(.all)
                
                
                // Main Add Button
                MenuBarView()
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .zIndex(2)
                }
                .onAppear {
                    menuObject.dailyKCalPercent = Double(menuObject.inputtedCalories) / 2500.0
                    UserDefaults.standard.set(menuObject.inputtedCalories, forKey: "DailyKCal")
                    let df = DateFormatter()
                    df.dateFormat = "dd/MM/yyyy"
                    
                    if df.string(from: menuObject.curDate as! Date) != df.string(from: Date()) {
                        UserDefaults.standard.set(Date(), forKey: "curDate")
                    }
                }
                
            }
            .environmentObject(menuObject)
        
    }
}

// - MARK: Preview Provider
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(MenuClass())
    }
}
