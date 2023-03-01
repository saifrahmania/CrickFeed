//
//  TeamRanking.swift
//  Pods
//
//  Created by BJIT on 25/2/23.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let teamRanking = try? JSONDecoder().decode(TeamRanking.self, from: jsonData)

import Foundation

// MARK: - TeamRanking
struct TeamRanking:Codable {
    var data: [DataModel]
}

// MARK: - Datum
struct DataModel:Codable {
    var resource, type: String?
    var gender, updated_at: String?
    var team: [TeamInfo]?
}

// MARK: - Team
struct TeamInfo:Codable {
    var id: Int?
    var name, code: String?
    var image_path: String?
    var country_id: Int?
    var national_team: Bool?
    var position: Int?
    var updated_at: String?
    var ranking: RankingValue?
}

// MARK: - Ranking
struct RankingValue:Codable {
    var position, matches, points, rating: Int?
}


