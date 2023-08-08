import SwiftUI

struct MatchDivider: View {
    var body: some View {
        Divider()
            .frame(maxWidth: 200)
    }
}

struct ScoreboardView: View {
    private let matchUseCases: MatchUseCase = MatchUseCase()
    var cMatch: Match
    
    private func getAMatchValue(_ match: Match) async throws {
        try await matchUseCases.getAllValues([match])
        print(matchUseCases)
    }
    
    var body: some View {
        VStack {
            
            VStack {
                
                HStack {
                    if let firstOpponent = cMatch.opponents.first??.opponent {
                        MatchCard(teamImage: firstOpponent.image_url ?? "", teamName: firstOpponent.name)
                            .background(Color.fromHex(Colors.mainColor.rawValue))
                    }
                    Text("VS")
                        .foregroundColor(Color.fromHex(Colors.textTitleColor.rawValue))
                        .font(.custom("Roboto", size: 15))
                        .padding(.horizontal, 10)
                    if let secondOpponent = cMatch.opponents.last??.opponent {
                        MatchCard(teamImage: secondOpponent.image_url ?? "", teamName: secondOpponent.name)
                            .background(Color.fromHex(Colors.mainColor.rawValue))
                    }
                }.background(Color.fromHex(Colors.mainColor.rawValue))
                    .padding(20)
            }.background(Color.fromHex(Colors.mainColor.rawValue))
            
            Divider().background(Color.white).frame(height: 3)
                .frame(maxWidth: .infinity)
                .edgesIgnoringSafeArea(.horizontal)
            
            VStack(alignment: .leading, spacing: 1) {
                
                HStack(alignment: .center) {
                    if let leagueImage = cMatch.league?.image_url {
                        Image(leagueImage)
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                    if let leagueName = cMatch.league?.name {
                        Text(leagueName)
                            .font(.custom("Roboto-Medium", size: 10))
                            .foregroundColor(Color.fromHex(Colors.textTitleColor.rawValue))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                }.background(Color.fromHex(Colors.mainColor.rawValue))
            }.background(Color.fromHex(Colors.mainColor.rawValue))
        }
    }
    
    
    
    
    
    
    //        GeometryReader { geometry in
    //            ScrollViewReader { ScrollViewProxy in
    //                HStack(spacing: 5) {
    //                    MatchCard(teamImage: matchUseCases.oponnents?.first?.opponent.image_url, teamName: matchUseCases.oponnents?.first?.opponent.name)
    //                        .frame(maxWidth: .infinity, maxHeight: .in)
    //                    Text("vs")
    //                        .foregroundColor(Color.fromHex(Colors.textSubTileColor.rawValue))
    //
    //                    MatchCard(teamImage: matchUseCases.oponnents?.last?.opponent.image_url, teamName: matchUseCases.oponnents?.last?.opponent.name)
    //                        .frame(maxWidth: .infinity)
    //
    //                }
    //
    //                Divider()
    //                    .frame(height: 1)
    //                    .background(Color.fromHex(Colors.textSubTileColor.rawValue))
    //                    .offset(y:30)
    //                VStack(alignment: .listRowSeparatorLeading) {
    //                    LeagueInfoView(leagueName: matchUseCases.leagues?.first?.name, leagueImage: "splash_logo").offset(x: -100, y: 30)
    //
    //                }
    //            }
    //
    //        }
    //        .task {
    //            do {
    //                let _ = try await getAMatchValue(cMatch)
    //            } catch  {
    //
    //            }
    //        }
}


struct Previews_ScoreBoard_Previews: PreviewProvider {
    static var previews: some View {
        let opponentA = Match.OpponentDetalhes(acronym: "OPA", id: 1, image_url: "splash_logo", location: "City A", modified_at: "2023-08-08T14:00:00Z", name: "Team A", slug: "team-a")
        let opponentB = Match.OpponentDetalhes(acronym: "OPB", id: 2, image_url: "splash_logo", location: "City B", modified_at: "2023-08-08T14:00:00Z", name: "Team B", slug: "team-b")
        
        let match = Match(begin_at: "2023-08-08T15:00:00Z",
                          detailed_stats: true,
                          draw: false,
                          end_at: "2023-08-08T16:30:00Z",
                          forfeit: false,
                          game_advantage: "best_of_3",
                          games: [Match.Game(begin_at: "2023-08-08T15:00:00Z", complete: true, detailed_stats: true, end_at: "2023-08-08T15:45:00Z", finished: true, forfeit: false, id: 1, length: 45, match_id: 123, position: 1, status: "completed", winner: "Team A", winner_type: "Team"),
                                  Match.Game(begin_at: "2023-08-08T16:00:00Z", complete: true, detailed_stats: true, end_at: "2023-08-08T16:45:00Z", finished: true, forfeit: false, id: 2, length: 45, match_id: 123, position: 2, status: "completed", winner: "Team B", winner_type: "Team")],
                          id: 123,
                          league: Match.League(id: 456, image_url: "splash_logo", modified_at: "2023-08-08T14:00:00Z", name: "Example League", slug: "example-league", url: "https://example.com/league"),
                          league_id: 456,
                          live: Match.Live(opens_at: "2023-08-08T14:30:00Z", supported: true, url: "https://twitch.tv/examplestream"),
                          match_type: "tournament",
                          modified_at: "2023-08-08T14:30:00Z",
                          name: "Semifinal Match",
                          number_of_games: 2,
                          opponents: [Match.Opponent(opponent: opponentA, type: "Team"), Match.Opponent(opponent: opponentB, type: "Team")],
                          original_scheduled_at: "2023-08-08T15:00:00Z",
                          rescheduled: false,
                          results: [Match.Results(score: 2, teamId: 1), Match.Results(score: 1, teamId: 2)],
                          scheduled_at: "2023-08-08T15:00:00Z",
                          serie: Match.Serie(begin_at: "2023-08-01T00:00:00Z", end_at: "2023-08-31T00:00:00Z", full_name: "Example Series", id: 789, league_id: 456, modified_at: "2023-07-01T00:00:00Z", name: "Season 1", season: "Summer", slug: "season-1", winner_id: "teamA", winner_type: "Team", year: 2023),
                          serie_id: 789,
                          slug: "semifinal-match",
                          status: "completed",
                          streams_list: [Match.StreamList(embedURL: "https://player.twitch.tv/?channel=examplestream", language: "en", main: true, official: true, rawURL: "https://twitch.tv/examplestream")],
                          tournament: Match.Tournament(begin_at: "2023-07-01T00:00:00Z", detailed_stats: true, end_at: "2023-08-31T00:00:00Z", has_bracket: true, id: 987, league_id: 456, live_supported: true, modified_at: "2023-07-01T00:00:00Z", name: "Example Tournament", prizepool: "$100,000", serie_id: 789, slug: "example-tournament", tier: "Major", winner_id: "teamA", winner_type: "Team", year: 2023),
                          tournament_id: 987,
                          videogame: Match.Videogame(id: 1, name: "Example Game", slug: "example-game"),
                          videogame_version: "1.0",
                          winner: "Team A",
                          winner_id: "teamA",
                          winner_type: "Team")
        
        
        let scoreboardView = ScoreboardView(cMatch: match)
    }
}
