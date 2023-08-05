//
//  MatchModel.swift
//  FuzeCSMatch
//
//  Created by Raphael Buchler on 03/08/23.
//

import Foundation

@MainActor
class MatchesModel: ObservableObject {
    @Published var getAMatches: [Match] = []
    @Published var getPastMatches: [Match] = []
    @Published var runningMatches: [Match] = []
    @Published var getUpcomingMatches: [Match] = []
    @Published var isLoading: Bool = false
    @Published var getMatchDetail: Match?
    
    var httpClient = HTTPClient()
    
    func getmacthes() async throws -> [Match] {
        let resource = try await PaginatedResource(url: Constants.URLS.getMatches(), modelType: [Match].self)
        let paginatedResult = try await httpClient.load(resource)
        getAMatches = paginatedResult.items
        return getAMatches
    }
    
    func getAPastMatches() async throws -> [Match] {
        let resource = try await PaginatedResource(url: Constants.URLS.getPastMatches(), modelType: [Match].self)
        let pastMatches = try await httpClient.load(resource)
        getPastMatches = pastMatches.items
        return getAMatches
    }
    
    func getRunningMatches() async throws -> [Match] {
        let resource = try await PaginatedResource(url: Constants.URLS.getPastMatches(), modelType: [Match].self)
        let rMatches = try await httpClient.load(resource)
        runningMatches = rMatches.items
        return runningMatches
    }
    
    func getUpcomingMatches() async throws -> [Match] {
        let resource = try await PaginatedResource(url: Constants.URLS.getUpcomingMatches(), modelType: [Match].self)
        let upcomingMatches = try await httpClient.load(resource)
        getUpcomingMatches = upcomingMatches.items
        return getUpcomingMatches
    }
    
    func getDetailFromMatch(_ matchID: Int) async throws -> Match? {
        let resource = try await PaginatedResource(url: Constants.URLS.getMatchDetails(matchID), modelType: Match.self)
        let matchDetail = try await httpClient.load(resource)
        getMatchDetail = matchDetail.items
        return getMatchDetail
    }
    
    func getMatchesFromJSON() async throws -> [Match] {
        guard let url = Bundle.main.url(forResource: "matches", withExtension: "json") else {
            throw NSError(domain: "MatchesModel", code: 404, userInfo: [NSLocalizedDescriptionKey: "JSON File not Found."])
        }
        
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let matches = try decoder.decode([Match].self, from: data)
        getAMatches = matches
        return matches
    }
    
}
