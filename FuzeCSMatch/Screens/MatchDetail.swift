//
//  MatchDetail.swift
//  FuzeCSMatch
//
//  Created by Raphael Buchler on 04/08/23.
//

import SwiftUI

struct MatchDetail: View {
    var match: Match?
    
    @State private var isPresented: Bool = false
    @EnvironmentObject private var model: MatchesModel
    
    private func fetchMatchInfo() async {
        do {
            guard let id = match?.games?.first?.id else {
                throw NetworkError.badRequest
            }
            model.getMatchDetail = try await model.getDetailFromMatch(id)
        } catch {
            model.getMatchDetail = await loadFromJSON()
        }
    }
    
    private func loadFromJSON() async -> Match? {
        let localMatchData = try? await model.getMatchesFromJSON().first
        if var existingMatch = model.getMatchDetail {
            if let firstOpponentPlayers = localMatchData?.opponents.first?.opponent.players {
                existingMatch.opponents[0].opponent.players?.insert(contentsOf: firstOpponentPlayers, at: 0)
            }
            
            if let lastOpponentPlayers = localMatchData?.opponents.last?.opponent.players {
                existingMatch.opponents[1].opponent.players?.insert(contentsOf: lastOpponentPlayers, at: 1)
            }
            return existingMatch
        }
        return localMatchData
    }

    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                Text((model.getMatchDetail?.league.name ?? "League") + " - " + (model.getMatchDetail?.serie.full_name ?? "Series"))
                    .font(.custom(Constants.CFRoboto.robotoBoldItalic, size: 15))
                    .foregroundColor(.white)
                    .padding(.top, 20)
                    .padding(.leading, 20)
                    .lineLimit(1)
                    .offset(y: -50)
                ScrollView(.vertical) {
                    VStack {
                        VStack {
                           HStack {
                               if let firstOpponent = model.getMatchDetail?.opponents.first?.opponent,
                                  let secondOpponent = model.getMatchDetail?.opponents.last?.opponent {
                                   MatchCard(teamImage: firstOpponent.image_url ?? "" , teamName: firstOpponent.name)
                                    Text("VS")
                                        .foregroundColor(Color.fromHex(Colors.textTitleColor.rawValue))
                                        .font(.custom(Constants.CFRoboto.robotoBold, size: 15))
                                        .padding(.horizontal, 10)
                                   MatchCard(teamImage: secondOpponent.image_url ?? "", teamName: secondOpponent.name)
                                }
                            }.background(Color.fromHex(Colors.secondaryColor.rawValue))
                                .padding()
                            if let matchDate = Date.iso8601Formatter.date(from: model.getMatchDetail?.begin_at ?? "") {
                                Text("\(matchDate.formattedRelativeDate())")
                                    .foregroundColor(Color.fromHex(Colors.textTitleColor.rawValue))
                                    .font(.custom(Constants.CFRoboto.robotoBold, size: 15))
                                    .padding(.horizontal, 10)
                            }
                        }
                        
                        Divider()
                            .background(Color.black)
                            .frame(height: 10)
                            .frame(maxWidth: .infinity)
                            .edgesIgnoringSafeArea(.horizontal)
                    }
                    
                    if let firstOpponent = model.getMatchDetail?.opponents.first?.opponent.players,
                       let secondOpponent = model.getMatchDetail?.opponents.last?.opponent.players {
                        HStack(spacing: -30) {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 150, maximum: 200))], alignment: .leading, spacing: 25) {
                                   ForEach(firstOpponent, id: \.nickname) { player in
                                       PlayerCardTeamA(playerName: player.name, playerNickName: player.nickname, playerImage: "splash_logo")
                                           .frame(maxWidth: .infinity)
                                   }.edgesIgnoringSafeArea(.all)
                               }.background(Color.fromHex(Colors.secondaryColor.rawValue))
                                .padding()
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 150, maximum: 200))], alignment: .leading, spacing: 25) {
                                   ForEach(secondOpponent, id: \.nickname) { player in
                                       PlayerCardTeamB(playerNickName: player.nickname, playerName: player.name, playerImage: "splash_logo")
                                           .frame(maxWidth: .infinity)
                                   }.edgesIgnoringSafeArea(.all)
                                       
                               }.background(Color.fromHex(Colors.secondaryColor.rawValue))
                                .padding()
                        }
                    }
                }   .navigationBarTitle("", displayMode: .inline)
                    .background(Color.fromHex(Colors.secondaryColor.rawValue))
                    .task {
                        await fetchMatchInfo()
                        
                    }
            }
        }.background(Color.fromHex(Colors.secondaryColor.rawValue))
           
    }
}

