import Foundation

struct Match: Codable {
    struct Game: Codable {
        let begin_at: String?
        let complete: Bool?
        let detailed_stats: Bool?
        let end_at: String?
        let finished: Bool?
        let forfeit: Bool?
        let id: Int?
        let length: Int?
        let match_id: Int?
        let position: Int?
        let status: String?
        struct Winner: Codable {
                let id: String?
                let type: String?
            }
        let winner_type: String?
    }
    
    struct League: Codable {
        let id: Int
        let image_url: String
        let modified_at: String
        let name: String
        let slug: String
        let url: String?
    }
    
    struct Live: Codable {
        let opens_at: String?
        let supported: Bool
        let url: String?
    }
    
    struct Opponent: Codable {
        var opponent: OpponentDetails
        let type: String?
    }

    struct OpponentDetails: Codable {
        let acronym: String?
        let id: Int
        let image_url: String?
        let location: String?
        let modified_at: String
        let name: String
        let slug: String
        var players: [Player]?
    }

    struct Player: Codable {
        let name: String
        let nickname: String
        let image_url: String
    }

    struct Results: Codable {
        let score: Int?
        let team_id: Int?
    }
    
    struct Serie: Codable {
        let begin_at: String?
        let end_at: String?
        let full_name: String?
        let id: Int?
        let league_id: Int
        let modified_at: String?
        let name: String?
        let season: String?
        let slug: String?
        let winner_id: String?
        let winner_type: String?
        let year: Int?
    }
    
    struct StreamList: Codable {
        let embedURL: String?
        let language: String?
        let main: Bool?
        let official: Bool?
        let rawURL: String?
    }
    
    struct Tournament: Codable {
        let begin_at: String
        let detailed_stats: Bool
        let end_at: String?
        let has_bracket: Bool
        let id: Int
        let league_id: Int
        let live_supported: Bool
        let modified_at: String
        let name: String?
        let prizepool: String?
        let serie_id: Int
        let slug: String
        let tier: String
        let winner_id: String?
        let winner_type: String?
        let year: Int?
    }
    
    struct Videogame: Codable {
        let id: Int?
        let name: String?
        let slug: String?
    }
    
    let begin_at: String
    let detailed_stats: Bool
    let draw: Bool
    let end_at: String?
    let forfeit: Bool
    let game_advantage: String?
    let games: [Game]?
    let id: Int
    let league: League
    let league_id: Int
    let live: Live?
    let match_type: String
    let modified_at: String
    let name: String
    let number_of_games: Int
    var opponents: [Opponent]
    let original_scheduled_at: String
    let rescheduled: Bool
    let results: [Results]
    let scheduled_at: String
    let serie: Serie
    let serie_id: Int
    let slug: String
    let status: String
    let streams_list: [StreamList]
    let tournament: Tournament?
    let tournament_id: Int?
    let videogame: Videogame?
    let videogame_version: String?
    let winner: String?
    let winner_id: String?
    let winner_type: String?
}

