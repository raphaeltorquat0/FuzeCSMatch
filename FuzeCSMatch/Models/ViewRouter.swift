//
//  AppState.swift
//  FuzeCSMatch
//
//  Created by Raphael Buchler on 03/08/23.
//

import Foundation

enum Route: Hashable {
    case matchListScreen
    case splashScreen
    case detailedMachScreen(Match)
}

class AppState: ObservableObject {
    @Published var routes: [Route] = []
}
