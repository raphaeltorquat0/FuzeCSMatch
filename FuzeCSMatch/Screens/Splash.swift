import SwiftUI

struct SplashView: View {
    @Binding var isMatchListPresented: Bool
    
    var body: some View {
        VStack {
            Image("splash_logo")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.fromHex(Colors.secondaryColor.rawValue))
        .ignoresSafeArea()
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                isMatchListPresented = true
            }
        }
        .fullScreenCover(isPresented: $isMatchListPresented) {
            MatchListScreen()
                .background(Color.fromHex(Colors.secondaryColor.rawValue))
        }
    }
}
