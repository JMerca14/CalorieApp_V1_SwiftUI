// - MARK: Imports
import SwiftUI

// - MARK: Profile View
struct ProfileView: View {
    // - MARK: Environments
    @EnvironmentObject var menuObject: MenuClass
    
    var body: some View {
        ZStack {
            Image("Background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .offset(y: -30)
                .zIndex(0)
            
            Button("Welcome to the Profile Page!!") {
                self.menuObject.isShowingProfile = false
            }
            .zIndex(1)
        }
    }
}

// - MARK: Preview Provider
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(MenuClass())
    }
}
