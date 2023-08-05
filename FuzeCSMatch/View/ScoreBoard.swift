import SwiftUI

struct ScoreboardView: View {
    private let matchUseCases: MatchUseCase = MatchUseCase()
    var cMatch: Match
    
    private func getAMatchValue(_ match: Match) async throws {
        try await matchUseCases.getAllValues([match])
        print(matchUseCases)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollViewReader { ScrollViewProxy in
                HStack(spacing: 5) {
                    MatchCard(teamImage: matchUseCases.oponnents?.first?.opponent.image_url, teamName: matchUseCases.oponnents?.first?.opponent.name)
                        .frame(maxWidth: .infinity)
                    Text("VS")
                        .foregroundColor(Color.fromHex(Colors.textTitleColor.rawValue))
                        .font(.headline)
                    MatchCard(teamImage: matchUseCases.oponnents?.last?.opponent.image_url, teamName: matchUseCases.oponnents?.last?.opponent.name)
                        .frame(maxWidth: .infinity)
                }
                .frame(height: 100)
                .padding()
                .background(Color.fromHex(Colors.mainColor.rawValue))
                .foregroundColor(Color.fromHex(Colors.textTitleColor.rawValue))
                .cornerRadius(10)
                .padding(.horizontal, 15)
                
                Divider()
                    .background(Color.fromHex(Colors.textTitleColor.rawValue))
                    .frame(height: 3)
                
                HStack {
                    Spacer()
                    Group {
                        LeagueInfoView(leagueName: matchUseCases.leagues?.first?.name, leagueImage: matchUseCases.leagues?.first?.image_url)
                            .frame(width: 300, height: 80)
                    }
                    .background(Color.fromHex(Colors.mainColor.rawValue))
                    .aspectRatio(contentMode: .fit)
                }
                
            }
            
        }
        .task {
            do {
                let _ = try await getAMatchValue(cMatch)
            } catch  {
                
            }
        }
    }
}
