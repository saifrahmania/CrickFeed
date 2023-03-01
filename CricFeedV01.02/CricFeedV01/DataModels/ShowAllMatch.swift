// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let showAllMatch = try? JSONDecoder().decode(ShowAllMatch.self, from: jsonData)

import Foundation

// MARK: - ShowAllMatch
struct ShowAllMatch: Codable {
    var data: [DatumAll]
    
}

// MARK: - Datum
struct DatumAll:Codable {
    
    var id, league_id, season_id, stage_id: Int?
    var round: String?
    var localteam_id, visitorteam_id: Int?
    var starting_at: String?
    var type: String?
    var live: Bool?
    var status: String?
    var note: String?
    var elected: String?
    var league: LeagueAll?
    var localteam, visitorteam: LeagueAll?
    var runs: [RunAll]
    var venue: VenueAll?
    var stage: LeagueAll?
}



// MARK: - League
struct LeagueAll: Codable {
    var id, season_id, country_id: Int?
    var name, code: String?
    var image_path: String?
    var type: String?
    var updated_at: String?
    var national_team: Bool?
    var league_id: Int?
    var standings: Bool?
}



// MARK: - Run
struct RunAll:Codable {
    
    var id, fixture_id, team_id, inning: Int?
    var score, wickets: Int?
    var overs: Double?
    
}





// MARK: - Venue
struct VenueAll: Codable {
    
    var id, country_id: Int?
    var name, city: String?
    var image_path: String?
    
}

