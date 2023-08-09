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
    @State private var selectedMatch: Match? = nil
    
    private func fetchMatches()  {
        Task {
            background {
                Color.fromHex(Colors.secondaryColor.rawValue)
            }
            do {
                isLoading = true
                model.getAMatches = try await model.getmacthes()
                isLoading = false
                
            } catch {
                print("Error fetching more matches: \(error.localizedDescription)")
            }
        }
    }
    
    init () {
        
        UICollectionView.appearance().backgroundColor = UIColor(Color.fromHex(Colors.secondaryColor.rawValue))
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                if isLoading {
                    
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .scaleEffect(2.0)
                        .background(Color.fromHex(Colors.secondaryColor.rawValue))
                } else {
                    Text("Partidas")
                        .font(.custom(Constants.CFRoboto.robotoBold, size: 50))
                        .foregroundColor(.white)
                        .padding(.top, 20)
                        .padding(.leading, 20)
                    if (model.getAMatches.isEmpty) {
                        HStack {
                            Text("There's no matches found")
                                .foregroundColor(Color.fromHex(Colors.textTitleColor.rawValue))
                                .font(.custom(Constants.CFRoboto.robotoBold, size: 30))
                        }.background(Color.fromHex(Colors.secondaryColor.rawValue))
                    } else {
                        List(model.getAMatches, id: \.self) { match in
                            Button(action: {
                                selectedMatch = match
                            }) {
                                ScoreboardView(cMatch: match)
                                    .listRowInsets(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                                    .listRowSeparator(.visible, edges: .bottom)
                            }.background(Color.fromHex(Colors.mainColor.rawValue))
                                .listRowBackground(Color.fromHex(Colors.secondaryColor.rawValue))
                                .cornerRadius(10)
                        }
                        .background(Color.fromHex(Colors.secondaryColor.rawValue))
                    }
                        
                }
                }
                
                
            .background(Color.fromHex(Colors.secondaryColor.rawValue))
            .edgesIgnoringSafeArea(.bottom)
            .navigationDestination(for: Match.self, destination: { match in
                MatchDetail(match: match)
            })
            .background(Color.fromHex(Colors.secondaryColor.rawValue))
            NavigationLink("", destination: MatchDetail(match: selectedMatch ?? nil), isActive: $isPresented)
                .background(Color.fromHex(Colors.secondaryColor.rawValue))
                .opacity(0)
                .onChange(of: selectedMatch, perform: { newSelectedMatch in
                    if newSelectedMatch != nil {
                        isPresented = true
                        selectedMatch = nil
                    }
                })
                
            .task {
                do {
                    fetchMatches()
                }
            }
        }
        .padding()
        .edgesIgnoringSafeArea(.bottom)
        .background(Color.fromHex(Colors.secondaryColor.rawValue))
    }
    
    @State private var isLoading: Bool = false
}

struct MatchListScreenContainerView: View {
    @StateObject private var model = MatchesModel()
    @StateObject private var appState = AppState()
    @State private var isMatchListScreenActive = false
    var body: some View {
        NavigationStack(path: $appState.routes) {
            MatchListScreen()
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .matchListScreen:
                        MatchListScreen()
                    case .splashScreen:
                        SplashView(isMatchListPresented: $isMatchListScreenActive)
                    case .detailedMachScreen(let match):
                        MatchDetail(match: match)
                    }
                }
                .background(Color.fromHex(Colors.secondaryColor.rawValue))
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

