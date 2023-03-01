// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let showUpcomingList = try? JSONDecoder().decode(ShowUpcomingList.self, from: jsonData)

import Foundation

// MARK: - ShowUpcomingList
struct ShowUpcomingList: Codable {
    var data: [DataModelUpcomingMatch]
  
}

// MARK: - Datum
struct DataModelUpcomingMatch:Codable {
    var id: Int?
    var note: String?
    var league: LeagueUpcomingMatch?
    var season: SeasonUpcomingMatch?
    var localteam, visitorteam: LeagueUpcomingMatch?
    var runs: [RunUpcomingMatch]?
    var venue: VenueUpcomingMatch?
    var stage: LeagueUpcomingMatch?
}

// MARK: - League
struct LeagueUpcomingMatch:Codable {
    
    var id, season_id, country_id: Int?
    var name, code: String?
    var image_path: String?
    var type: String?
    var nationalTeam: Bool?
    var leagueID: Int?
    var standings: Bool?
}







// MARK: - Run
struct RunUpcomingMatch: Codable {
    
    var id, fixture_id, team_id, inning: Int?
    var score, wickets: Int?
    var overs: Double?
    
}



// MARK: - Season
struct SeasonUpcomingMatch:Codable {
    
    var id, league_id: Int?
    var name, code: String?
    
}



// MARK: - Venue
struct VenueUpcomingMatch:Codable {
    var id, countryID: Int?
    var name, city: String?
    var imagePath: String?
    var capacity: Int?
    var floodlight: Bool?
    var updatedAt: String?
}




