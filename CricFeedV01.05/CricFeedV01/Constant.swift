//
//  Constant.swift
//  CricFeedV01
//
//  Created by BJIT on 11/2/23.
//

import Foundation
struct Constant {
    static let fixtureSections = ["Days","Series"]
    static let matchesSection = ["Live","Home","Recent","Upcoming","Finished"]
    static let fixtureDateCell = "FixtureDateTable"
    static let fixtureSeriesCell = "FixtureSeriesTable"
    static let matchLiveCell = "tableDateCell"
    static let matchUpcomingCell = "FixtureDateTable"
    static let matchFinishedCell = "FixtureDateTable"
    static let matchMenuCell = "MatchMenuCell"
    static let fixtureMenuCell = "MatchMenuCell"
    static let upcomingTable = "UpcomingTable"
    static let apiToken = "mYC7mFGDBRtTMmG1Y81Ctv2TFCcf59Kab7Gr4uqBFuELTemcirhfpuLQYyzR#"
    static let apiLink = "https://cricket.sportmonks.com/api/v2.0"
    static let fetchSeriesList = "https://cricket.sportmonks.com/api/v2.0/leagues?sort=-updated_at&api_token=mYC7mFGDBRtTMmG1Y81Ctv2TFCcf59Kab7Gr4uqBFuELTemcirhfpuLQYyzR#"
    static let linkOfScoreboard = "https://cricket.sportmonks.com/api/v2.0/fixtures/46106?sort=-updated_at&include=batting.batsman,bowling.bowler,runs,scoreboards,localteam,visitorteam,stage&api_token=mYC7mFGDBRtTMmG1Y81Ctv2TFCcf59Kab7Gr4uqBFuELTemcirhfpuLQYyzR"
    static let linkForLineUp = "https://cricket.sportmonks.com/api/v2.0/fixtures/46106?include=lineup&api_token=mYC7mFGDBRtTMmG1Y81Ctv2TFCcf59Kab7Gr4uqBFuELTemcirhfpuLQYyzR"
    static let linkForAllMatch = "https://cricket.sportmonks.com/api/v2.0/fixtures?include=runs,localteam,visitorteam&api_token=mYC7mFGDBRtTMmG1Y81Ctv2TFCcf59Kab7Gr4uqBFuELTemcirhfpuLQYyzR&sort=-updated_at"
    static let linkForUpcoming = "https://cricket.sportmonks.com/api/v2.0/fixtures?fields[teams]=code,name,image_path&fields[fixtures]=id,type,starting_at&filter[status]=NS&include=localteam,visitorteam,venue&api_token=mYC7mFGDBRtTMmG1Y81Ctv2TFCcf59Kab7Gr4uqBFuELTemcirhfpuLQYyzR"
    //"https://cricket.sportmonks.com/api/v2.0/fixtures?include=runs,localteam,visitorteam&api_token=mYC7mFGDBRtTMmG1Y81Ctv2TFCcf59Kab7Gr4uqBFuELTemcirhfpuLQYyzR"
    //"https://cricket.sportmonks.com/api/v2.0/fixtures?fields[teams]=code,name,image_path&fields[fixtures]=id,type,starting_at&filter[status]=Finished&include=runs,localteam,visitorteam&api_token=mYC7mFGDBRtTMmG1Y81Ctv2TFCcf59Kab7Gr4uqBFuELTemcirhfpuLQYyzR"
}
