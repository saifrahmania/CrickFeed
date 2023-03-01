//
//  FixtureMatchesExtension.swift
//  CricFeedV01
//
//  Created by BJIT on 18/2/23.
//

import Foundation
import UIKit
import SDWebImage

extension FixtureMatches: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return receiveDateResult.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let matchTableCell = fixtureMatches.dequeueReusableCell(withIdentifier: Constant.fixtureDateCell, for: indexPath) as? FixtureDateTable
        matchTableCell?.dateTournamentName.text = receiveDateResult[indexPath.row].league?.name
        matchTableCell?.dateTournamentTime.text = calculateDateDifference(dateString: receiveDateResult[indexPath.row].starting_at! )
        matchTableCell?.dateTeamOneName.text = receiveDateResult[indexPath.row].localteam?.code
        matchTableCell?.dateTeamTwoName.text = receiveDateResult[indexPath.row].visitorteam?.code
        matchTableCell?.dateTeamOneThumb.sd_setImage(with: URL(string: (receiveDateResult[indexPath.row].localteam?.image_path)! ), placeholderImage: UIImage(systemName: "pencil"))
        matchTableCell?.dateTeamTwoThumb.sd_setImage(with: URL(string: (receiveDateResult[indexPath.row].visitorteam?.image_path)! ), placeholderImage: UIImage(systemName: "pencil"))
        if (receiveDateResult[indexPath.row].runs.count == 2){
            matchTableCell?.dateTeamOneScore.text = "\(receiveDateResult[indexPath.row].runs[0].score)/\(receiveDateResult[indexPath.row].runs[0].wickets)"
            matchTableCell?.dateTeamOneBalls.text = "\(receiveDateResult[indexPath.row].runs[0].overs )"
            matchTableCell?.dateTeamTwoScore.text = "\(receiveDateResult[indexPath.row].runs[1].score)/\(receiveDateResult[indexPath.row].runs[1].wickets)"
            matchTableCell?.dateTeamTwoBalls.text = "\(receiveDateResult[indexPath.row].runs[1].overs)"
        } else {
            matchTableCell?.dateTeamOneScore.isHidden = true
            matchTableCell?.dateTeamOneBalls.isHidden = true
            matchTableCell?.dateTeamTwoScore.isHidden = true
            matchTableCell?.dateTeamTwoBalls.isHidden = true
        }
        
        return matchTableCell ?? UITableViewCell()
    }
    
    func retrieveDataFromHTTPCalls()  {
        dataFromHTTPCalls.getFixtures(url:Constant.linkForAllMatch){(countryResult: Result<ShowAllMatch,Error>) in
            switch countryResult{
                
            case .success(let result):
                self.receiveDateResult = result.data
                dump(self.receiveDateResult)
                DispatchQueue.main.async {
                    self.fixtureMatches.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func calculateDateDifference(dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS'Z'"
        guard let date = dateFormatter.date(from: dateString) else { return "" }
        
        let currentDate = Date()
        let difference = currentDate.timeIntervalSince(date)
        let secondsInADay: Double = 60 * 60 * 24
        let days = Int(difference / secondsInADay)
        
        if days == 0 {
            return "today"
        } else if days < 0 {
            let futureDays = abs(days)
            let months = futureDays / 30
            let years = months / 12
            
            if years > 0 {
                return "\(years) years \(months % 12) months \(futureDays % 30) days later"
            } else if months > 0 {
                return "\(months) months \(futureDays % 30) days later"
            } else {
                return "\(futureDays) days later"
            }
        } else {
            let months = days / 30
            let years = months / 12
            
            if years > 0 {
                return "\(years) years \(months % 12) months \(days % 30) days ago"
            } else if months > 0 {
                return "\(months) months \(days % 30) days ago"
            } else {
                return "\(days) days ago"
            }
        }
    }
    
}
