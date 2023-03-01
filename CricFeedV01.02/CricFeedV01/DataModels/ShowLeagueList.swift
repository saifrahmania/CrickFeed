// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let showLeagueList = try? JSONDecoder().decode(ShowLeagueList.self, from: jsonData)

import Foundation

// MARK: - ShowLeagueList
struct ShowLeagueList: Codable {
    var data: [Datum2]
}

// MARK: - Datum
struct Datum2: Codable {
    var resource: String?
    var id, season_id, country_id: Int?
    var name, code: String?
    var image_path: String
    var type, updated_at: String?

    
}

