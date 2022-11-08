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
                    HStack {
                        VStack {
                            Text("Welcome, Juanito!")
                                .multilineTextAlignment(.leading)
                                .bold()
                                .foregroundColor(.white)
                                .padding(.leading, 0)
                                .fontWeight(.bold)
                                .font(.system(size: 20))
                            Text("Let's see how you're doing!")
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.gray)
                                .font(.system(size: 10))
                                .padding(.leading, -20)
                        }
                        .frame(width: 200,height: 25)
                        .position(x: 115, y: 70)
                        
                        Spacer()
                            .frame(width: 250)
                        
                        NavigationLink(destination: ProfileView().navigationBarBackButtonHidden(true), isActive: $menuObject.isShowingProfile) {
                            Image("PFP")
                                .clipShape(Circle())
                                .shadow(radius: 10)
                                .overlay(Circle().stroke(Color.red, lineWidth: 2))
                                .padding(.top, 30.0)
                                .position(y: 50)
                        }
                    }
                }
                .offset(x: 10, y: 5)
                
                ScrollView {
                    VStack {
                        ZStack {
                            Rectangle()
                                .background(.ultraThinMaterial)
                                .foregroundColor(CustomColors.backdropAccentColor.opacity(0.35))
                                .foregroundStyle(.ultraThinMaterial)
                                .cornerRadius(10)
                                .frame(width: 350, height: 360)
                            
                            HStack {
                                NavigationLink(destination: ProgressViewNew().navigationBarBackButtonHidden(true), isActive: $menuObject.isShowingProgress) {
                                    Text("PROGRESS")
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                    
                                    Spacer()
                                        .frame(width: 15)
                                    
                                    Image(systemName: "chevron.forward")
                                        .resizable()
                                        .foregroundColor(.white)
                                        .frame(width: 15, height: 20)
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .offset(x: -40, y: -150)
                            
                        }
                        
                        Spacer()
                            .frame(height: 20)
                        
                        HStack {
                            ZStack {
                                Rectangle()
                                    .background(.ultraThinMaterial)
                                    .foregroundColor(CustomColors.backdropAccentColor.opacity(0.6))
                                    .foregroundStyle(.ultraThinMaterial)
                                    .cornerRadius(10)
                                    .frame(width: 165, height: 220)
                                
                                VStack {
                                    VStack(alignment: .leading) {
                                        Text("\(menuObject.inputtedCalories) KCal(s)")
                                            .foregroundColor(.white)
                                            .bold()
                                            .font(.system(size: 20))
                                        
                                        Text("Today's KCal Intake")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 15))
                                    }
                                    
                                    Spacer()
                                        .frame(height: 25)
                                    
                                    ZStack {
                                        Circle()
                                            .stroke(CustomColors.backdropColor, lineWidth: 10)
                                            .frame(width: 125, height: 125)
                                        
                                        Circle()
                                            .trim(from: 0, to: menuObject.dailyKCalPercent)
                                            .stroke(CustomColors.accentColor, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                                            .frame(width: 125, height: 125)
                                            .rotationEffect(.degrees(-90))
                                        
                                        Text("\(menuObject.dailyKCalPercent * 100, specifier: "%0.f")%")
                                            .bold()
                                            .font(.title)
                                            .foregroundColor(.white)
                                    }
                                }
                                .offset(y: -6)
                            }
                                
                            Spacer()
                                .frame(width: 20)
                            
                            Rectangle()
                                .background(.ultraThinMaterial)
                                .foregroundColor(CustomColors.backdropAccentColor.opacity(0.6))
                                .foregroundStyle(.ultraThinMaterial)
                                .cornerRadius(10)
                                .frame(width: 165, height: 220)
                        }
                    }
                }
                .offset(y: 115)
                
                Image("Home_Icon")
                    .resizable()
                    .frame(width: 300, height: 150)
                    .offset(y: 350)
                    .foregroundColor(CustomColors.backdropAccentColor)
                
                NavigationLink(destination: AddCalorieView().navigationBarBackButtonHidden(true), isActive: $menuObject.isCalorieAdder) {
                    Image("Logo")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .shadow(color: .black, radius: 5, x: 0, y: 5)
                        .offset(y: -35)
                }
                .zIndex(2)
                .frame(maxHeight: .infinity, alignment: .bottom)
                
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
