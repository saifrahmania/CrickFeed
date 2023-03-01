//
//  ShowLineUp.swift
//  CricFeedV01
//
//  Created by BJIT on 20/2/23.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let showLineUp = try? JSONDecoder().decode(ShowLineUp.self, from: jsonData)

import Foundation

// MARK: - ShowLineUp
struct ShowLineUp:Codable {
    var data: LineupDataClass?
}

// MARK: - DataClass
struct LineupDataClass:Codable {
    
    var id, league_id, season_id, stage_id: Int?
    var round: String?
    var localteam_id, visitorteam_id: Int?
    var starting_at, type: String?
    var live: Bool?
    var status: String?
    var note: String?
    var elected: String?
    var lineup: [LineupElement]?
}

// MARK: - LineupElement
struct LineupElement:Codable {
    
    var id, country_id: Int?
    var firstname, lastname, fullname: String?
    var image_path: String?
    var dateofbirth: String?
    var gender: String?
    var battingstyle: String?
    var bowlingstyle: String?
    var position: Position?
    var updated_at: String?
    var lineup: LineupLineup?
}





// MARK: - LineupLineup
struct LineupLineup:Codable {
    var team_id: Int?
    var captain, wicketkeeper, substitution: Bool?
}

// MARK: - Position
struct LineupPosition: Codable {
    var id: Int?
    var name: String?
}
