//
//  PreviousMatch.swift
//  CricFeedV01
//
//  Created by BJIT on 16/2/23.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let previousMatch = try? JSONDecoder().decode(PreviousMatch.self, from: jsonData)

import Foundation

// MARK: - PreviousMatch
struct PreviousMatch:Codable {
    var data: [DatumPrevious]?
   
}

// MARK: - Datum
struct DatumPrevious:Codable {
    var id, league_id: Int?
    var round, starting_at: String?
    var status: String?
    var note: String?
    var localteam, visitorteam: TeamPrevious?
    var runs: [RunPrevious]?
    var venue: VenuePrevious?
    var stage: StagePrevious?
}

// MARK: - Team
struct TeamPrevious:Codable {
    
    var id: Int?
    var name, code: String?
    var image_path: String?
    
}






// MARK: - Run
struct RunPrevious:Codable {
    
    var id, fixture_id, team_id, inning: Int?
    var score, wickets: Int?
    var overs: Double?
    
}



// MARK: - Stage
struct StagePrevious:Codable {
    var id: Int?
    var name: String?
}
// MARK: - Venue
struct VenuePrevious:Codable {
    var id, country_id: Int?
    var name, city: String?
    var image_path: String?
    
}



