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
    
    private func fetchMatches()  {
        Task {
            do {
                model.getAMatches = try await model.getMatchesFromJSON()
                //try await model.getmacthes()
            } catch {
                print("Error fetching more matches: \(error.localizedDescription)")
            }
        }
    }
    
    private func fetchPastedMatches() async throws {
        do {
            model.getPastMatches = try await model.getAPastMatches()
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
        NavigationStack {
            VStack(alignment: .listRowSeparatorLeading) {
                Text("Partidas")
                    .font(.custom("Roboto-bold", size: 50))
                    .foregroundColor(.white)
                    .padding(.top, 20)
                if (model.getAMatches.isEmpty) {
                    HStack {
                        Text("There's no matches found")
                    }
                } else {
                    List(model.getAMatches) { match in
                        NavigationLink(value: match) {
                            ScoreboardView(cMatch: match)
                        }
                        .listRowBackground(Color.fromHex(Colors.mainColor.rawValue))
                    }
                }
            } .background(Color.fromHex(Colors.mainColor.rawValue))
           
        }
        .background(Color.fromHex(Colors.mainColor.rawValue))
        .navigationDestination(for: Match.self) { match in
            MatchDetail(match: match)
                .navigationBarTitle(Text("\(match.name ?? "Matches")"))
            
            
        }.task {
            do {
                fetchMatches()
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
        MatchListScreen().environmentObject(MatchesModel())
    }
}

