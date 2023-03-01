// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let showUpcomingList = try? JSONDecoder().decode(ShowUpcomingList.self, from: jsonData)

import Foundation

// MARK: - ShowUpcomingList
struct ShowUpcomingList: Codable {
    var data: [DataModelForUpcoming]
}

// MARK: - Datum
struct DataModelForUpcoming: Codable {
    
    var id, league_id, season_id, stage_id: Int?
    var round: String?
    var localteam_id, visitorteam_id: Int?
    var starting_at: String?
    var type: String?
    var live: Bool?
    var status: String?
    var note: String?
    var venue_id: Int?
    var league: LeagueForUpcomming?
    var season: SeasonForUpcoming?
    var localteam, visitorteam: LeagueForUpcomming?
    var runs: Int?
    var venue: VenueForUpcoming?
    var stage: LeagueForUpcomming?
}

// MARK: - League
struct LeagueForUpcomming: Codable {
    var name, code: String?
    var image_path: String?
    var national_team: Bool?
    var league_id: Int?
    var standings: Bool?
}








// MARK: - Season
struct SeasonForUpcoming: Codable {
    
    var id, league_id: Int?
    var name, code: String?
    
}








// MARK: - Venue
struct VenueForUpcoming: Codable{
    var resource: String?
    var id, country_id: Int?
    var name, city: String?
    var image_path: String?
   
    
}





