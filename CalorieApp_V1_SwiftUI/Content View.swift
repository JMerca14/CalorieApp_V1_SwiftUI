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
    @Published var isReg = false
    @Published var regOffset = ["x": CGFloat(0.0), "y": (0.0)]
    @Published var menuYOffset = CGFloat(500.0)
    
    @Published var profileDataArray = UserDefaults.standard.object(forKey: "AppDataV1") as? [String: String] ?? ["FirstName": "", "LastName": ""] // This is our datastore
    @Published var inputtedCalories = UserDefaults.standard.integer(forKey: "DailyKCal")
    @Published var dailyKCalPercent = 0.0
    @Published var curDate = UserDefaults.standard.object(forKey: "curDate") ?? Date()
}


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
                    
                    // Add Register View
                    RegisterView()
                        .offset(x: menuObject.regOffset["x"]!, y: menuObject.regOffset["y"]!)
                        .animation(.easeInOut(duration: 0.2), value: menuObject.regOffset)
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
                //.cornerRadius(menuIsShowing ? 20 : 10)
                .offset(x: menuIsShowing ? 300 : 0, y: -13)
                            //menuIsShowing ? 44 : -13)
                //.scaleEffect(menuIsShowing ? 0.8 : 1)
                //.shadow(radius: 30)
                
                Rectangle()
                    .opacity(loadOpacity)
                    .animation(.easeInOut(duration: 0.5), value: loadOpacity)
                    .foregroundColor(.gray)
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: .infinity, height: .infinity)
            }
            .onAppear {
                if (menuObject.profileDataArray["FirstName"]!.isEmpty) {
                    menuObject.isReg = true
                    loadOpacity = 0
                    menuObject.regOffset["x"] = 0
                    menuObject.menuYOffset = 100
                } else {
                    menuObject.regOffset["x"] = 500
                }
                
                menuIsShowing.toggle()
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
