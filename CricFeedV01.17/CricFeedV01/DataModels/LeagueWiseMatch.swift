//
//  LeagueWiseMatch.swift
//  CricFeedV01
//
//  Created by BJIT on 25/2/23.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let leagueWiseMatch = try? JSONDecoder().decode(LeagueWiseMatch.self, from: jsonData)

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let leagueWiseMatch = try? JSONDecoder().decode(LeagueWiseMatch.self, from: jsonData)

import Foundation

// MARK: - LeagueWiseMatch
struct LeagueWiseMatch: Codable {
    var data: [DataModelLeagueWise]
}

// MARK: - Datum
struct DataModelLeagueWise: Codable {
    var id, league_id, season_id, stage_id: Int?
    var round: String?
    var localteam_id, visitorteam_id: Int?
    var starting_at: String?
    var type: String?
    var live: Bool?
    var status: String?
    var note: String?
    var elected: String?
    var league, localteam, visitorteam: League?
    var runs: [RunLeague]?
}



// MARK: - League
struct League: Codable {
    var id, season_id, country_id: Int?
    var name, code: String?
    var image_path: String?
   
}

// MARK: - Run
struct RunLeague: Codable {
    var id, fixture_id, team_id, inning: Int?
    var score, wickets: Int?
    var overs: Double?
}

