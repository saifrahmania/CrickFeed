//
//  DetailsModel2.swift
//  CricFeedV01
//
//  Created by BJIT on 23/2/23.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let detailsModel3 = try? JSONDecoder().decode(DetailsModel3.self, from: jsonData)

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let detailsModel2 = try? JSONDecoder().decode(DetailsModel2.self, from: jsonData)

import Foundation

// MARK: - DetailsModel2
struct DetailsModel2: Codable {
    var data: DataClass?
}

// MARK: - DataClass
struct DataClass: Codable {
    var id, league_id, season_id, stage_id: Int?
    var round: String?
    var localteam_id, visitorteam_id: Int?
    var starting_at, type: String?
    var live: Bool?
    var status: String?
    var note: String?
    var venue_id, toss_won_team_id, winner_team_id: Int?
    var man_of_match_id: Int?
    var total_overs_played: Int?
    var elected: String?
    var localteam, visitorteam: Localteam?
    var batting: [Batting]?
    var bowling: [Bowling]?
    var runs: [Run]?
    var scoreboards: [ScoreboardElement]?
    var lineup: [LineupElement]?
    var winnerteam, tosswon: Localteam?
    var venue: Venue?
    var stage: Stage?
}

// MARK: - Batting
struct Batting: Codable {
    var id, sort, fixture_id, team_id: Int?
    var active: Bool?
    var scoreboard: String?
    var player_id, ball, score_id, score: Int?
    var four_x, six_x: Int?
    var rate: Int?
    var batsman: LineupElement?
}

// MARK: - LineupElement
struct LineupElement: Codable {
    var id, country_id: Int?
    var firstname, lastname, fullname: String?
    var image_path: String?
    var dateofbirth: String?
    var gender: String?
    var battingstyle: String?
    var bowlingstyle: String?
    var position: Position?
    var lineup: LineupLineup?
}


// MARK: - LineupLineup
struct LineupLineup:Codable {
    var team_id: Int?
    var captain, wicketkeeper, substitution: Bool?
}

// MARK: - Position
struct Position: Codable {
    var id: Int?
    var name: String?
}





// MARK: - Bowling
struct Bowling: Codable {
    var id, sort, fixture_id, team_id: Int?
    var active: Bool?
    var scoreboard: String?
    var player_id: Int?
    var overs: Double?
    var medians, runs, wickets, wide: Int?
    var noball: Int?
    var rate: Double?
    var bowler: LineupElement?
}

// MARK: - Localteam
struct Localteam: Codable {
    var id: Int?
    var name, code: String?
    var image_path: String?
    var country_id: Int?
}


// MARK: - Run
struct Run: Codable {
    var id, fixture_id, team_id, inning: Int?
    var score, wickets: Int?
    var overs: Double?
    var pp1: String?
}

// MARK: - ScoreboardElement
struct ScoreboardElement: Codable {
    var id, fixture_id, team_id: Int?
    var type: String?
    var scoreboard: String?
    var wide, noball_runs, noball_balls, bye: Int?
    var legBye, penalty, total: Int?
    var overs: Double?
    var wickets: Int?
}

// MARK: - Stage
struct Stage:Codable {
    var resource: String?
    var id, league_id, season_id: Int?
    var name, code, type: String?
    var standings: Bool?
}

// MARK: - Venue
struct Venue:Codable {
    var resource: String?
    var id, country_id: Int?
    var name, city: String?
    var image_path: String?
}






