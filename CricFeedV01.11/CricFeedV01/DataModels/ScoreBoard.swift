//
//  ShowScoreCard.swift
//  CricFeedV01
//
//  Created by BJIT on 18/2/23.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let scoreBoard = try? JSONDecoder().decode(ScoreBoard.self, from: jsonData)

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let scoreBoard = try? JSONDecoder().decode(ScoreBoard.self, from: jsonData)

import Foundation

// MARK: - ScoreBoard
struct ScoreBoard: Codable {
    var data: DataClassScore?
}

// MARK: - DataClass
struct DataClassScore: Codable {
    var id, league_id, season_id, stage_id: Int?
    var round: String?
    var localteam_id, visitorteam_id: Int?
    var starting_at, type: String?
    var live: Bool?
    var status: String?
    var note: String?
    var venue_id, toss_won_team_id, winner_team_id: Int?
    var total_overs_played: Int?
    var elected: String?
    
    var localteam, visitorteam: TeamScore?
    var batting: [BattingScore]?
    var bowling: [BowlingScore]?
    var runs: [RunScore]?
    var scoreboards: [ScoreboardElementScore]?
    var stage: StageScore?
}

// MARK: - Batting
struct BattingScore: Codable {
    
    var id, sort, fixture_id, team_id: Int?
    var active: Bool?
    var scoreboard: String?
    var player_id, ball, score_id, score: Int?
    var four_x, six_x: Int?
    var fow_score: Int?
    var fow_balls: Double?
    var rate: Int?
    var updated_at: String?
    var batsman: BatsmanScore?
}

// MARK: - Batsman
struct BatsmanScore: Codable {
    var id, country_id: Int?
    var firstname, lastname, fullname: String?
    var image_path: String?
    var dateofbirth: String?
    var gender: String?
    var battingstyle: String?
    var bowlingstyle: String?
    var position: PositionScore?
    var updated_at: String?
}




// MARK: - Position
struct PositionScore: Codable {
   
    var id: Int?
    var name: String?
}




// MARK: - Bowling
struct BowlingScore: Codable {
    var id, sort, fixture_id, team_id: Int?
    var active: Bool?
    var scoreboard: String?
    var player_id: Int?
    var overs: Double?
    var medians, runs, wickets, wide: Int?
    var noball: Int?
    var rate: Double?
    var updated_at: String?
    var bowler: BatsmanScore?
}



// MARK: - Team
struct TeamScore: Codable {
    var id: Int?
    var name, code: String?
    var image_path: String?
    var country_id: Int?
    var national_team: Bool?
    var updated_at: String?
}



// MARK: - Run
struct RunScore: Codable {
    var resource: String?
    var id, fixture_id, team_id, inning: Int?
    var score, wickets: Int?
    var overs: Double?
    var pp1: String?
    var updated_at: String?
}

// MARK: - ScoreboardElement
struct ScoreboardElementScore: Codable {
    var resource: String?
    var id, fixture_id, team_id: Int?
    var type: String?
    var scoreboard: String?
    var wide, noball_runs, noball_balls, bye: Int?
    var leg_bye, penalty, total: Int?
    var overs: Double?
    var wickets: Int?
    var updated_at: String?
}

// MARK: - Stage
struct StageScore: Codable {
    var resource: String?
    var id, league_id, season_id: Int?
    var name, code, type: String?
    var standings: Bool?
    var updated_at: String?
}
