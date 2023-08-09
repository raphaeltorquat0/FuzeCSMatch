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
    
    
    struct CFRoboto {
        static var robotoBlack = "Roboto-Black"
        static var robotoBlackItalic = "Roboto-BlackItalic"
        static var robotoBold = "Roboto-Bold"
        static var robotoBoldItalic = "Roboto-BoldItalic"
        static var robotoItalic = "Roboto-Italic"
        static var robotoLight = "Roboto-Light"
        static var robotoLightItalict = "Roboto-LightItalic"
        static var robotoMedium = "Roboto-Medium"
        static var robotoMediumItalic = "Roboto-MediumItalic"
        static var robotoRegular = "Roboto-Regular"
        static var robotoThin = "Roboto-Thin"
        static var robotoThinItalic = "Roboto-ThinItalic"
    }
    
    
    struct URLS {
        static var currentPage = 1
        static var pageSize = 7
        
        static func getMatches() async throws -> URL {
            guard let getMatches = URL(string: "\(baseURLPath)/matches?per_page=\(pageSize)?filter=2023-08-05") else {
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
        
        static func getAMatch(matchID: Int) async throws -> URL {
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
        
        static func getMatchDetails(_ csgo_game_id: Int) async throws -> URL {
            guard let getMatchDetails = URL(string: "\(baseURLPath)/games/\(csgo_game_id)") else {
                throw NetworkError.invalidURL
            }
            return getMatchDetails
        }
        
    }
}
