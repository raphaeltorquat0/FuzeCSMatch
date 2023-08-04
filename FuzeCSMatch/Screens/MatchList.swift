//
//  MatchListScreen.swift
//  FuzeCSMatch
//
//  Created by Raphael Buchler on 03/08/23.
//

import SwiftUI

struct MatchListScreen: View {
    @EnvironmentObject private var model: MatchesModel
    @EnvironmentObject private var appState: AppState
    @State private var isPresented: Bool = false
    
    private func fetchMatches() async throws {
        do {
            try await model.loadMoreMatches()
        }
    }
    
    private func fetchPastedMatches() async throws {
        do {
            try await model.getAPastMatches()
        }
    }
    
    private func fetchRunningMatches() async throws {
        do {
            try await model.getRunningMatches()
        }
    }
    
    private func fetchUpcomingMatches() async throws {
        do {
            try await model.getUpcomingMatches()
        }
    }
    
    private func fetchMoreMatches() {
        Task {
            do {
                try await fetchMatches()
            } catch {
                print("Error fetching more matches: \(error.localizedDescription)")
            }
        }
    }
    
    var body: some View {
        
        VStack {
            
            if model.getMatches.isEmpty {
                HStack {
                    Text("There's no matches found")
                }
            } else {
                List {
                    ForEach(model.getMatches) { match in
                        ScoreboardView(opponents: match.opponents.compactMap({ $0 }), cMatch: match).listRowInsets(EdgeInsets())
                        
                    }
                }
            }
        }
        .task {
            do {
                let matchesData = try await model.getMacthes()
                model.getMatches = matchesData
                print("\(model.getMatches)")
                
            } catch {
                print("Error fetching matches from JSON: \(error.localizedDescription)")
            }
        }
        
    }
}

struct MatchListScreenContainerView: View {
    @StateObject private var model = MatchesModel()
    @StateObject private var appState = AppState()
    
    var body: some View {
        NavigationStack(path: $appState.routes) {
            MatchListScreen()
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .matchListScreen:
                        MatchListScreen()
                    case .splashScreen:
                        MatchListScreen()
                    case .detailedMachScreen(_):
                        MatchListScreen()
                    }
                }
                .environmentObject(model)
                .environmentObject(appState)
        }
    }
    
}

struct MatchListScreen_Previews: PreviewProvider {
    static var previews: some View {
        MatchListScreen()
        
    }
}

