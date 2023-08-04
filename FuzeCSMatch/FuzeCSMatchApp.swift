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
            
            NavigationView {
                if !appState.routes.isEmpty {
                    SplashScreen()
                        .environmentObject(appState)
                } else {
                    NavigationStack(path: $appState.routes) {
                        MatchListScreen().environmentObject(model).environmentObject(appState)
                            .navigationDestination(for: Route.self) { route in
                                switch route {
                                case .matchListScreen:
                                    MatchListScreen()
                                case .splashScreen:
                                    SplashScreen()
                                case .detailedMachScreen:
                                    MatchListScreen()
                                }
                            }
                    }
                    .environmentObject(model)
                    .environmentObject(appState)
                    .onAppear {
                        isMatchListScreenActive = true
                    }
                }
                
            }
            
        }
    }
}

