//
//  File.swift
//  CricFeedV01
//
//  Created by BJIT on 20/2/23.
//

import Foundation
import UIKit
extension UpcomingViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("RowCount\(receiveUpcomingResult.count)")
            return receiveUpcomingResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let upcomingTableCell = upcomingTable.dequeueReusableCell(withIdentifier: Constant.upcomingTable, for: indexPath) as? UpcomingTable
        upcomingTableCell?.upcomingDate.text
        = calculateDateDifference(dateString: receiveUpcomingResult[indexPath.row].starting_at ?? "")
        upcomingTableCell?.upcomingTeamOneName.text = receiveUpcomingResult[indexPath.row].visitorteam?.code
        upcomingTableCell?.upcomingTeamOneThumb.sd_setImage(with: URL(string: (receiveUpcomingResult[indexPath.row].visitorteam?.image_path)!), placeholderImage: UIImage(systemName: "pencil"))
        upcomingTableCell?.upcomingTeamTwoName.text = receiveUpcomingResult[indexPath.row].localteam?.code
        upcomingTableCell?.upcomingTeamTwoThumb.sd_setImage(with: URL(string: (receiveUpcomingResult[indexPath.row].localteam?.image_path)!), placeholderImage: UIImage(systemName: "pencil"))
        upcomingTableCell?.upcomingVenue.text = receiveUpcomingResult[indexPath.row].venue?.name
        
        
        return upcomingTableCell ?? UITableViewCell()
    }
    
    func retrieveDataFromHTTPCalls(){
        dataFromHTTPCalls.getFixtures(url: Constant.linkForUpcoming){ (countryResult: Result<UpcomingMatch,Error>) in
            switch countryResult{
                
            case .success(let result):
                self.receiveUpcomingResult = result.data
                //dump(self.receiveUpcomingResult)
                DispatchQueue.main.async {
                    self.upcomingTable.reloadData()
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
