//
//  Constants.swift
//  FuzeCSMatch
//
//  Created by Raphael Buchler on 03/08/23.
//

import Foundation

struct Constants {
    private static let baseURLPath = "https://api.pandascore.co/csgo"
    static let accessToken = "i7KIQ27D7Rn3_SKzAQtYcpQelZQIY_jLB99rqK9cmdcm97hNDQ4"
    
    struct URLS {
        
        static var currentPage = 1
        static var pageSize = 10
        
        static func getMatches() async throws -> URL {
            guard let getMatches = URL(string: "\(baseURLPath)/matches?per_page=\(pageSize)") else {
                throw NetworkError.invalidURL
            }
            return getMatches
        }
        
        static func getPastMatches() async throws -> URL {
            guard let getPastMatches = URL(string:"\(baseURLPath)/matches/past") else {
                throw NetworkError.invalidURL
            }
            return getPastMatches
        }
        
        static func getRunningMatches() async throws -> URL {
            guard let getRunningMatches = URL(string: "\(baseURLPath)/matches/running") else {
                throw NetworkError.invalidURL
            }
            return getRunningMatches
        }
        
        static func getAMatch(matchID: String) async throws -> URL {
            guard let getAMatch = URL(string: "\(baseURLPath)/matches/\(matchID)") else  {
                throw NetworkError.invalidURL
            }
            return getAMatch
        }
        
        static func getUpcomingMatches() async throws -> URL {
            guard let getUpcomingMatches = URL(string: "\(baseURLPath)/matches/upcoming") else {
                throw NetworkError.invalidURL
            }
            return getUpcomingMatches
        }
    }
}
