// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let upcomingMatch = try? JSONDecoder().decode(UpcomingMatch.self, from: jsonData)

import Foundation

// MARK: - UpcomingMatch
struct UpcomingMatch:Codable {
    var data: [DataUpcoming]
    
}

// MARK: - Datum
struct DataUpcoming:Codable {
    
    var id: Int?
    var starting_at: String?
    var type: String?
    var localteam, visitorteam: TeamUpcoming?
    var venue: Venue?
}

// MARK: - Team
struct TeamUpcoming:Codable {
    
    var id: Int?
    var name, code: String?
    var image_path: String?
    var updated_at: String?
}

struct Venue: Codable{
    
    var id, countryID: Int?
    var name, city: String?
    var imagePath: String?
    var capacity: Int?
    var floodlight: Bool?
    var updatedAt: String?
}



