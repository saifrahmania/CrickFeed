//
//  UpComingMatch.swift
//  CricFeedV01
//
//  Created by BJIT on 16/2/23.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let upcomingMatch = try? JSONDecoder().decode(UpcomingMatch.self, from: jsonData)

import Foundation

// MARK: - UpcomingMatch
struct UpcomingMatch {
    var data: [DatumUpcoming]?
    
}

// MARK: - Datum
struct DatumUpcoming {
    
    var id, league_id: Int?
    var round, starting_at: String?
    var status: String?
    var note: String?
    var localteam, visitorteam: TeamUpcoming?
    var venue: VenueUpcoming?
    var stage: String?
}

// MARK: - Team
struct TeamUpcoming {
    
    var name, code: String?
    var image_path: String?
    
}




// MARK: - Stage






// MARK: - Venue
struct VenueUpcoming {
    
    
    var name, city: String?
    var image_path: String?
    
    
}



