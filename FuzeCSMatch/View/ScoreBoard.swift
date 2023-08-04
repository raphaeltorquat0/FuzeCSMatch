import SwiftUI

struct ScoreboardView: View {
    var opponents: [Opponent]
    var cMatch: Match?
    
    
    private func getOpponents(_ opponents:[Opponent]) async throws -> [Opponent] {
        guard !opponents.isEmpty else {
            throw NetworkError.badRequest
        }
        
        return opponents
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollViewReader { ScrollViewProxy in
                LazyVStack(spacing: 10) {
                    ZStack(alignment: .center) {
                        HStack(alignment: .center)  {
                            MatchCard(opponent: opponents.first)
                            Text("vs")
                            MatchCard(opponent: opponents.last)
                        }
                        .frame(height: max(geometry.size.height, 300))
                        .offset(y: -50)
                        Divider()
                        VStack(alignment: .leading) {
                            Spacer()
                            LeagueInfoView(cMatch: cMatch)
                                .frame(height: 80)
                        }
                        .padding(.bottom, 10)
                    }
                    .padding()
                    .cornerRadius(10)
                    .frame(maxWidth:.infinity, alignment: .center)
                }
            }
        }
        .task {
            do {
                let _ = try await getOpponents(opponents)
            } catch  {
                
            }
        }
    }
}
