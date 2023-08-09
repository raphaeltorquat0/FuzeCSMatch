//
//  MatchUseCase.swift
//  FuzeCSMatch
//
//  Created by Raphael Buchler on 04/08/23.
//

import Foundation

class MatchUseCase: NSObject {
    var oponnents: [Match.Opponent]?
    var games: [Match.Game]?
    var lives: [Match.Live]?
    var leagues: [Match.League]?
    var streams: [Match.StreamList]?
    var series: [Match.Serie]?
    var tournament: [Match.Tournament]?
    var results: [Match.Results]?
    
    public func getAllValues(_ match: [Match]) async throws {
        let filteredMatches = match.compactMap{$0}
        guard !filteredMatches.isEmpty else {
            throw NetworkError.badRequest
        }
        for filteredMatch in filteredMatches {
            self.oponnents = try await getOpponents(filteredMatch.opponents)
            self.games = try await getGames(filteredMatch.games ?? [])
            self.lives = try await getLives([filteredMatch.live])
            self.leagues = try await getLeagues([filteredMatch.league])
            self.streams = try await getStreams(filteredMatch.streams_list)
        }
    }
    
    private func getOpponents(_ opponents:[Match.Opponent?]) async throws -> [Match.Opponent] {
        let filteredOpponents = opponents.compactMap { $0 }
        guard !filteredOpponents.isEmpty else {
            throw NetworkError.badRequest
        }
        return filteredOpponents
    }
    
    private func getGames(_ games: [Match.Game?]) async throws -> [Match.Game] {
        let filteredGames = games.compactMap { $0 }
        guard !filteredGames.isEmpty else {
            throw NetworkError.badRequest
        }
        return filteredGames
    }
    
    private func getLeagues(_ leagues: [Match.League?]) async throws -> [Match.League] {
        let filteredLeagues = leagues.compactMap { $0 }
        guard !filteredLeagues.isEmpty else {
            throw NetworkError.badRequest
        }
        return filteredLeagues
    }
    
    private func getLives(_ lives: [Match.Live?]) async throws -> [Match.Live] {
        let filteredLives = lives.compactMap { $0 }.filter { !(($0.opens_at ?? "").isEmpty) }
        guard !filteredLives.isEmpty else {
            throw NetworkError.badRequest
        }
        return filteredLives
    }
    
    private func getStreams(_ streams: [Match.StreamList?]) async throws -> [Match.StreamList] {
        let filteredStreams = streams.compactMap { $0 }
        guard !filteredStreams.isEmpty else {
            throw NetworkError.badRequest
        }
        return filteredStreams
    }
    
    private func getSeries(_ series: [Match.Serie?]) async throws -> [Match.Serie] {
        let filteredSeries = series.compactMap { $0 }
        guard !filteredSeries.isEmpty else {
            throw NetworkError.badRequest
        }
        return filteredSeries
    }
    
    private func getTournaments(_ tournaments: [Match.Tournament?]) async throws -> [Match.Tournament] {
        let filteredTournaments = tournaments.compactMap { $0 }
        guard !filteredTournaments.isEmpty else {
            throw NetworkError.badRequest
        }
        return filteredTournaments
    }
    
    private func getResults(_ results: [Match.Results?]) async throws -> [Match.Results] {
        let filteredResults = results.compactMap { $0 }
        guard !filteredResults.isEmpty else {
            throw NetworkError.badRequest
        }
        return filteredResults
    }
    
    struct MatchDetails {
        var oponnents: [Match.Opponent]
        var games: [Match.Game]
        var lives: [Match.Live]
        var leagues: [Match.League]
        var streams: [Match.StreamList]
        var series: [Match.Serie]
        var tournament: [Match.Tournament]
        var results: [Match.Results]
        
    }
}
