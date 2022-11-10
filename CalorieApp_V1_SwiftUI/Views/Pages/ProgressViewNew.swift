// - MARK: Imports
import SwiftUI

// - MARK: Progress View
struct ProgressViewNew: View {
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
            
            Button("Welcome to the Progress Page!") {
                self.menuObject.isShowingProgress = false
            }
            .zIndex(1)
        }
    }
}

// - MARK: Preview Provider
struct ProgressViewNew_Previews: PreviewProvider {
    static var previews: some View {
        ProgressViewNew()
            .environmentObject(MenuClass())
    }
}
