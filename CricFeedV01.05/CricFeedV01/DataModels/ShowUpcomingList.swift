// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let showUpcomingList = try? JSONDecoder().decode(ShowUpcomingList.self, from: jsonData)

import Foundation

// MARK: - ShowUpcomingList
struct ShowUpcomingList: Codable {
    var data: [DataModelUpcoming]
  
}

// MARK: - Datum
struct DataModelUpcoming:Codable {
    var id: Int?
    var note: String?
    var league: LeagueUpcoming?
    var season: SeasonUpcoming?
    var localteam, visitorteam: LeagueUpcoming?
    var runs: [RunUpcoming]?
    var venue: VenueUpcoming?
    var stage: LeagueUpcoming?
}

// MARK: - League
struct LeagueUpcoming:Codable {
    
    var id, season_id, country_id: Int?
    var name, code: String?
    var image_path: String?
    var type: String?
    var nationalTeam: Bool?
    var leagueID: Int?
    var standings: Bool?
}







// MARK: - Run
struct RunUpcoming: Codable {
    
    var id, fixture_id, team_id, inning: Int?
    var score, wickets: Int?
    var overs: Double?
    
}



// MARK: - Season
struct SeasonUpcoming:Codable {
    
    var id, league_id: Int?
    var name, code: String?
    
}



// MARK: - Venue
struct VenueUpcoming:Codable {
    
    var id, countryID: Int?
    var name, city: String?
    var imagePath: String?
    var capacity: Int?
    var floodlight: Bool?
    var updatedAt: String?
}




