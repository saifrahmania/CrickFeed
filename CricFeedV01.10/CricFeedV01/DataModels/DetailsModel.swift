//
//  DetailsModel.swift
//  CricFeedV01
//
//  Created by BJIT on 22/2/23.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let detailsModel = try? JSONDecoder().decode(DetailsModel.self, from: jsonData)

import Foundation

// MARK: - DetailsModel
struct DetailsModel: Codable {
    var data: DataClassDetails?
}

// MARK: - DataClass
struct DataClassDetails: Codable {
    
    var id, league_id, season_id, stage_id: Int?
    var round: String?
    var localteam_id, visitorteam_id: Int?
    var starting_at: String?
    var type: String?
    var live: Bool?
    var status: String?
    var venue_id, toss_won_team_id, winner_team_id: Int?
    var man_of_match_id: Int?
    var total_overs_played: Int?
    var elected: String?
    var league: LeagueDetails?
    var season: SeasonDetails?
    var localteam, visitorteam: LeagueDetails?
    var batting: [BattingDetails]?
    var bowling: [BowlingDetails]?
    var runs: [RunDetails]?
    var lineup: [ManofmatchDetails]?
    var manofmatch: ManofmatchDetails?
    var winnerteam, tosswon: LeagueDetails?
    var venue: VenueDetails?
    var stage: LeagueDetails?
}

// MARK: - Batting
struct BattingDetails: Codable {
    
    var id, sort, fixture_id, team_id: Int?
    var active: Bool?
    var scoreboard: String?
    var player_id, ball, score_id, score: Int?
    var four_x, six_x: Int?
    var rate: Int?
    var updatedAt: String?
    var batsman: ManofmatchDetails?
    var result: BattingResultDetails?
}

// MARK: - Manofmatch
struct ManofmatchDetails: Codable {
    var id, country_id: Int?
    var firstname, lastname, fullname: String?
    var image_path: String?
    var dateofbirth: String?
    var gender: String?
    var battingstyle: String?
    var bowlingstyle: String?
    var position: String?
    var updated_at: String?
    var lineup: LineupDetails?
}



// MARK: - Lineup
struct LineupDetails: Codable {
    var team_id: Int?
    var captain, wicketkeeper, substitution: Bool?
}

// MARK: - Position
struct PositionDetails: Codable {
    var id: Int?
    var name: String?
}

// MARK: - BattingResult
struct BattingResultDetails: Codable {
    var id: Int?
    var name: String?
    var runs: Int?
    var four, six: Bool?
    var bye, legBye, noball, noballRuns: Int?
    var isWicket, ball, out: Bool?
}


// MARK: - Bowling
struct BowlingDetails: Codable {
    var id, sort, fixture_id, team_id: Int?
    var active: Bool?
    var scoreboard: String?
    var player_id: Int?
    var overs: Double?
    var medians, runs, wickets, wide: Int?
    var noball: Int?
    var rate: Double?
    var updated_at: String?
    var bowler: ManofmatchDetails?
}



// MARK: - League
struct LeagueDetails: Codable {
    var id, season_id, country_id: Int?
    var name, code: String?
    var image_path: String?
    var type, updated_at: String?
    var national_team: Bool?
    var results: [ResultElementDetails]?
    var league_id: Int?
    var standings: Bool?
}

// MARK: - ResultElement
struct ResultElementDetails: Codable {
    var id, league_id, season_id, stage_id: Int?
    var round: String?
    var localteam_id, visitorteam_id: Int?
    var starting_at: String?
    var type: String?
    var live: Bool?
    var status: String?
    var note: String?
    var venue_id, toss_won_team_id: Int?
    var winner_team_id: Int?
    var draw_noresult: String?
    var man_of_match_id, total_overs_played: Int?
    var elected: String?

    
}








// MARK: - Run
struct RunDetails: Codable {
    var id, fixture_id, team_id, inning: Int?
    var score, wickets: Int?
    var overs: Double?
    var pp1: String?
    var updated_at: String?
}

// MARK: - Season
struct SeasonDetails: Codable {
    var id, league_id: Int?
    var name, code, updated_at: String?
}

// MARK: - Venue
struct VenueDetails: Codable {
    var id, country_id: Int?
    var name, city: String?
    var image_path: String? 
}

