//
//  Splash.swift
//  FuzeCSMatch
//
//  Created by Raphael Buchler on 03/08/23.
//

import SwiftUI

struct SplashScreen: View {
    @StateObject private var appState = AppState()
    
    var body: some View {
        VStack {
            Image("splash_logo")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
        }
        .background(Color.blue)
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2 ) {
                appState.routes = [.matchListScreen]
            }
        }
    }
}
