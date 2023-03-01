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
    var id, seasonID, countryID: Int?
    var name, code: String?
    var imagePath: String
    var type, updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case resource, id
        case seasonID = "season_id"
        case countryID = "country_id"
        case name, code
        case imagePath = "image_path"
        case type
        case updatedAt = "updated_at"
    }
}

