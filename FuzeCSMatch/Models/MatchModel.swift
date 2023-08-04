//
//  MatchModel.swift
//  FuzeCSMatch
//
//  Created by Raphael Buchler on 03/08/23.
//

import Foundation

@MainActor
class MatchesModel: ObservableObject {
    @Published var getMatches: [Match] = []
    @Published var getPastMatches: [Match] = []
    @Published var runningMatches: [Match] = []
    @Published var getUpcomingMatches: [Match] = []
    
    var httpClient = HTTPClient()
    
    func getMacthes() async throws -> [Match] {
        let resource = try await PaginatedResource(url: Constants.URLS.getMatches(), modelType: [Match].self)
        let paginatedResult = try await httpClient.load(resource)
        getMatches = paginatedResult.items
        return paginatedResult.items
    }
    
    func getAPastMatches() async throws {
        let resource = try await PaginatedResource(url: Constants.URLS.getPastMatches(), modelType: [Match].self)
        let pastMatches = try await httpClient.load(resource)
        getPastMatches = pastMatches.items
    }
    
    func getRunningMatches() async throws {
        let resource = try await PaginatedResource(url: Constants.URLS.getPastMatches(), modelType: [Match].self)
        let rMatches = try await httpClient.load(resource)
        runningMatches = rMatches.items
    }
    
    func getUpcomingMatches() async throws {
        let resource = try await PaginatedResource(url: Constants.URLS.getUpcomingMatches(), modelType: [Match].self)
        let upcomingMatches = try await httpClient.load(resource)
        getUpcomingMatches = upcomingMatches.items
    }
    
    func getMatchesFromJSON() async throws -> [Match] {
        guard let url = Bundle.main.url(forResource: "matches", withExtension: "json") else {
            throw NSError(domain: "MatchesModel", code: 404, userInfo: [NSLocalizedDescriptionKey: "JSON File not Found."])
        }
        
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let matches = try decoder.decode([Match].self, from: data)
        getMatches = matches
        return matches
    }
    
    func loadMoreMatches() async throws {
        try await getMacthes()
    }
}
