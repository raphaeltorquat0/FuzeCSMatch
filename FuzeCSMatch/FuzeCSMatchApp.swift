//
//  FuzeCSMatchApp.swift
//  FuzeCSMatch
//
//  Created by Raphael Buchler on 02/08/23.
//

import SwiftUI

@main
struct FuzeCSMatchApp: App {
    @StateObject private var model = MatchesModel()
    @StateObject private var appState = AppState()
    @State private var isMatchListScreenActive = false
    
    var body: some Scene {
        WindowGroup {
            if isMatchListScreenActive {
                MatchListScreen()
                    .environmentObject(model)
                    .environmentObject(appState)
                    .background(Color.fromHex(Colors.secondaryColor.rawValue))
            } else {
                SplashView(isMatchListPresented: $isMatchListScreenActive)
            }
            
        }
    }
}
