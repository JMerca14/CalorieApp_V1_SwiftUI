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
    static let popupBackground = Color("PopUpBackground")
    static let popupTextField = Color("PopUpTextField")
}

// - MARK: Classes
class MenuClass : ObservableObject {
    // Variables
    @Published var isHome = true
    @Published var isShowingProgress = false
    @Published var isShowingProfile = false
    @Published var isCalorieAdder = false
    @Published var isReg = false
    @Published var dailyKCalPercent = 0.0
    
    // Data Stores
    @Published var profileDataArray = ["FirstName": "", "LastName": ""]
    @Published var calorieDataArray = [String: Int]()
    @Published var inputtedCalories = 0
    @Published var curDate = UserDefaults.standard.object(forKey: "curDate") ?? Date()
    
    // Animation Variables
    @Published var PopUpSize = ["width": CGFloat(385), "height": CGFloat(200), "x": CGFloat(0.0), "y": 610.0, "AnimWidth": CGFloat(385), "AnimHeight": CGFloat(325)]
    @Published var calorieAdderOpacity = 0.0
    @Published var regOffset = ["x": CGFloat(0.0), "y": (0.0)]
    @Published var menuYOffset = CGFloat(500.0)
}

let UtilManager = UtilityManager()

// - MARK: Content View
struct ContentView: View {
    // - MARK: Observable Objects
    @ObservedObject var menuObject = MenuClass()
    @State private var menuIsShowing = true
    @State var hasLoaded = false
    @State var loadOpacity = 0.0
    
    var body: some View {
        NavigationView {
            
            ZStack {
                if menuIsShowing {
                    SideMenuView(menuIsShowing: $menuIsShowing)
                        .padding(.top, 30)
                }
                
                //HomeView
                ZStack {
                    Image("Background")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                    VStack {
                        // HEADER
                        Header(menuIsShowing: $menuIsShowing, title: "Home")
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
                        .offset(y: 10)
                    
                    // Add Register View
                    RegisterView()
                        .offset(x: menuObject.regOffset["x"]!, y: menuObject.regOffset["y"]!)
                        .animation(.easeInOut(duration: 0.2), value: menuObject.regOffset)
                }
                .offset(x: menuIsShowing ? 300 : 0, y: -13)
                
                Rectangle()
                    .foregroundColor(.black)
                    .ignoresSafeArea()
                    .frame(width: .infinity, height: .infinity)
                    .opacity(menuObject.calorieAdderOpacity)
                    .animation(.easeInOut(duration: 0.5), value: menuObject.calorieAdderOpacity)
                
                AddCalorieView()
                    .offset(y: menuObject.PopUpSize["y"]!)
                    .animation(.easeInOut(duration: 0.5), value: menuObject.PopUpSize["y"]!)
                
                Rectangle()
                    .opacity(loadOpacity)
                    .animation(.easeInOut(duration: 0.5), value: loadOpacity)
                    .foregroundColor(.gray)
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: .infinity, height: .infinity)
            }
            .onAppear {
                do {
                    menuObject.profileDataArray = try UtilManager.loadData(from: "AppDataTestV4.json", as: [String: String].self)
                } catch {
                    print("An error occurred: \(error)")
                }
                
                do {
                    menuObject.calorieDataArray = try UtilManager.loadData(from: "CalorieDataTestV3.json", as: [String: Int].self)
                } catch {
                    print("An error occurred: \(error)")
                }
                
                //UserDefaults.standard.set(menuObject.inputtedCalories, forKey: "DailyKCal")
                let df = DateFormatter()
                df.dateFormat = "dd/MM/yyyy"
                
                if menuObject.calorieDataArray[df.string(from: Date())] == nil {
                    menuObject.calorieDataArray[df.string(from: Date())] = menuObject.inputtedCalories
                    menuObject.inputtedCalories = 0
                    //UserDefaults.standard.set(menuObject.calorieDataArray, forKey: "CalorieDataTestV3")
                    
                    do {
                        try UtilManager.saveData(data: menuObject.calorieDataArray, to: "CalorieDataTestV3.json")
                    } catch {
                        print("An error occurred: \(error)")
                    }
                } else {
                    menuObject.inputtedCalories = menuObject.calorieDataArray[df.string(from: Date())] ?? 0
                }
                
                if df.string(from: menuObject.curDate as! Date) != df.string(from: Date()) {
                    UserDefaults.standard.set(Date(), forKey: "curDate")
                }
                
                if (menuObject.profileDataArray["FirstName"]!.isEmpty) {
                    menuObject.isReg = true
                    loadOpacity = 0
                    menuObject.regOffset["x"] = 0
                    menuObject.menuYOffset = 100
                } else {
                    menuObject.regOffset["x"] = 500
                }
                
                print(UtilManager.calculateCalorieNeeds(weight: Double(menuObject.profileDataArray["weight"]!)!, height: Double(menuObject.profileDataArray["height"]!)!, age: 23, gender: menuObject.profileDataArray["Gender"]!, activityLevel: "sedentary"))
                menuIsShowing.toggle()
                menuObject.dailyKCalPercent = Double(menuObject.inputtedCalories) / 2500.0
            }
        }
        .environmentObject(menuObject)
        .navigationBarHidden(true)
    }
}

// - MARK: Preview Provider
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
            .environmentObject(MenuClass())
    }
}
