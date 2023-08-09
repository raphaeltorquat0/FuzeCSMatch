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
                    if let firstOpponent = cMatch.opponents.first?.opponent,
                       let secondOpponent = cMatch.opponents.last?.opponent {
                        MatchCard(teamImage: firstOpponent.image_url ?? "", teamName: firstOpponent.name)
                        Text("VS")
                            .foregroundColor(Color.fromHex(Colors.textTitleColor.rawValue))
                            .font(.custom(Constants.CFRoboto.robotoBold, size: 15))
                            .padding(.horizontal, 10)
                        MatchCard(teamImage: secondOpponent.image_url ?? "", teamName: secondOpponent.name)
                            
                    }
                }
                .background(Color.fromHex(Colors.mainColor.rawValue))
                    .padding(10)
            }
            Divider()
                .background(Color.white)
                .frame(height: 3)
                .frame(maxWidth: .infinity)
                .edgesIgnoringSafeArea(.horizontal)
            
            VStack(alignment: .leading) {
                let leageNameAndSeriesName = "\(cMatch.league.name) + \(cMatch.serie.full_name!)"
                LeagueInfoView(leagueName: leageNameAndSeriesName, leagueImage: cMatch.league.image_url)
            }.background(Color.fromHex(Colors.mainColor.rawValue))
            
        }.cornerRadius(10)
    }
}
