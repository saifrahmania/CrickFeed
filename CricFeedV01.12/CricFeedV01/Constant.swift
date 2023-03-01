//
//  Constant.swift
//  CricFeedV01
//
//  Created by BJIT on 11/2/23.
//

import Foundation
struct Constant {
    static let scoreboardXib = "ScoreBoardList"
    static let finishedNotification = "com.notification.finished"
    static let fixtureDateCell = "FixtureDateTable"
    static let fixtureSeriesCell = "FixtureSeriesTable"
    static var detailsData:DataClass?
    static let matchLiveCell = "tableDateCell"
    static let matchUpcomingCell = "FixtureDateTable"
    static let detailsAPILink = "https://cricket.sportmonks.com/api/v2.0/fixtures/"
    static let detailsAPIIncluded =  "?sort=-updated_at&include=winnerteam&api_token=mYC7mFGDBRtTMmG1Y81Ctv2TFCcf59Kab7Gr4uqBFuELTemcirhfpuLQYyzR"
    //batting.batsman,bowling.bowler,runs,scoreboards,localteam,visitorteam,stage,lineup,venue,tosswon,winnerteam
    //batting.batsman,bowling.bowler,runs,scoreboards,localteam,visitorteam,stage,lineup,venue,tosswon,winnerteam
    static let matchMenuCell = "MatchMenuCell"
    static let fixtureMenuCell = "MatchMenuCell"
    static let matchFinishedCell = "MatchFinished"
    static let upcomingTable = "UpcomingTable"
    static let emptyLiveXib = "EmptyLive"
    static let fixtureCollectionXib = "FixtureDateCollcetion"
    static let DetailsViewController = "DetailsViewController"
    static let apiToken = "mYC7mFGDBRtTMmG1Y81Ctv2TFCcf59Kab7Gr4uqBFuELTemcirhfpuLQYyzR#"
    static let apiLink = "https://cricket.sportmonks.com/api/v2.0"
    static let fetchSeriesList = "https://cricket.sportmonks.com/api/v2.0/leagues?sort=-updated_at&api_token=mYC7mFGDBRtTMmG1Y81Ctv2TFCcf59Kab7Gr4uqBFuELTemcirhfpuLQYyzR#"
    static let linkForFinished = "https://cricket.sportmonks.com/api/v2.0/fixtures?include=visitorteam,localteam,runs,venue&sort=-updated_at&filter[status]=Finished&api_token=mYC7mFGDBRtTMmG1Y81Ctv2TFCcf59Kab7Gr4uqBFuELTemcirhfpuLQYyzR"
    static let linkOfScoreboard = "https://cricket.sportmonks.com/api/v2.0/fixtures/46106?sort=-updated_at&include=batting.batsman,bowling.bowler,runs,scoreboards,localteam,visitorteam,stage&api_token=mYC7mFGDBRtTMmG1Y81Ctv2TFCcf59Kab7Gr4uqBFuELTemcirhfpuLQYyzR"
    static let linkForLineUp = "https://cricket.sportmonks.com/api/v2.0/fixtures/46106?include=lineup&api_token=mYC7mFGDBRtTMmG1Y81Ctv2TFCcf59Kab7Gr4uqBFuELTemcirhfpuLQYyzR"
    static let linkForAllMatch = "https://cricket.sportmonks.com/api/v2.0/fixtures?include=runs,localteam,visitorteam&api_token=mYC7mFGDBRtTMmG1Y81Ctv2TFCcf59Kab7Gr4uqBFuELTemcirhfpuLQYyzR&sort=-updated_at"
    static let linkForLive = "https://cricket.sportmonks.com/api/v2.0/livescores?include=visitorteam,localteam,runs,venue&sort=-updated_at&api_token=mYC7mFGDBRtTMmG1Y81Ctv2TFCcf59Kab7Gr4uqBFuELTemcirhfpuLQYyzR"
    static let linkForUpcoming = "https://cricket.sportmonks.com/api/v2.0/fixtures?fields[teams]=code,name,image_path&fields[fixtures]=id,type,starting_at&filter[status]=NS&include=localteam,visitorteam,venue&api_token=mYC7mFGDBRtTMmG1Y81Ctv2TFCcf59Kab7Gr4uqBFuELTemcirhfpuLQYyzR"
    //"https://cricket.sportmonks.com/api/v2.0/fixtures?include=runs,localteam,visitorteam&api_token=mYC7mFGDBRtTMmG1Y81Ctv2TFCcf59Kab7Gr4uqBFuELTemcirhfpuLQYyzR"
    //"https://cricket.sportmonks.com/api/v2.0/fixtures?fields[teams]=code,name,image_path&fields[fixtures]=id,type,starting_at&filter[status]=Finished&include=runs,localteam,visitorteam&api_token=mYC7mFGDBRtTMmG1Y81Ctv2TFCcf59Kab7Gr4uqBFuELTemcirhfpuLQYyzR"
}

extension Constant{
    static func calculateDateDifference(dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS'Z'"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        guard let date = dateFormatter.date(from: dateString) else { return "" }
        
        let currentDate = Date()
        let difference = currentDate.timeIntervalSince(date)
        let secondsInADay: Double = 60 * 60 * 24
        let hoursInADay: Double = 24
        let days = Int(difference / secondsInADay)
        let hours = Int((difference / hoursInADay).truncatingRemainder(dividingBy: hoursInADay))
        
        if days == 0 {
            if hours == 0 {
                return "just now"
            } else {
                return "\(hours) hours ago"
            }
        } else if days < 0 {
            let futureDays = abs(days)
            let months = futureDays / 30
            let years = months / 12
            
            if years > 0 {
                return "\(years) years \(months % 12) months \(futureDays % 30) days \(hours) hours later"
            } else if months > 0 {
                return "\(months) months \(futureDays % 30) days \(hours) hours later"
            } else {
                return "\(futureDays) days \(hours) hours later"
            }
        } else {
            let months = days / 30
            let years = months / 12
            
            if years > 0 {
                return "\(years) years \(months % 12) months \(days % 30) days \(hours) hours ago"
            } else if months > 0 {
                return "\(months) months \(days % 30) days \(hours) hours ago"
            } else {
                return "\(days) days \(hours) hours ago"
            }
        }
    }

    static func convertDateFormat(_ dateString: String) -> String? {
        let dateFormatterInput = DateFormatter()
        dateFormatterInput.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"
        guard let date = dateFormatterInput.date(from: dateString) else {
            return nil
        }
        
        let dateFormatterOutput = DateFormatter()
        dateFormatterOutput.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let formattedDateString = dateFormatterOutput.string(from: date)
        return formattedDateString
    }
}


/**
 \(46106)?sort=-updated_at&include=batting.batsman,bowling.bowler,runs,scoreboards,localteam,visitorteam,stage&api_token=mYC7mFGDBRtTMmG1Y81Ctv2TFCcf59Kab7Gr4uqBFuELTemcirhfpuLQYyzR
 
 
 */
