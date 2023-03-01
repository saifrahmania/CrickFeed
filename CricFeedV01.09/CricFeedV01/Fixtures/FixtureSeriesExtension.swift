//
//  FixtureSeriesExtension.swift
//  CricFeedV01
//
//  Created by BJIT on 17/2/23.
//

import Foundation
import UIKit

extension FixtureSeries: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return receiveSeriesResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = seriesTable.dequeueReusableCell(withIdentifier: Constant.fixtureSeriesCell, for: indexPath) as? FixtureSeriesTable
        
        tableCell?.seriesDate.text = calculateDateDifference(dateString: receiveSeriesResult[indexPath.row].updated_at ?? "2022-12-29T12:26:45.000000Z")
        tableCell?.seriesName.text = receiveSeriesResult[indexPath.row].name
        tableCell?.seriesThumb.sd_setImage(with: URL(string:  receiveSeriesResult[indexPath.row].image_path), placeholderImage: UIImage(systemName: "pencil"))
        return tableCell!
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func retrieveDataFromHTTPCalls()  {
        dataFromHTTPCalls.getFixtures(url:Constant.fetchSeriesList){(countryResult: Result<ShowLeagueList,Error>) in
            switch countryResult{
                
            case .success(let result):
                self.receiveSeriesResult = result.data
                dump(self.receiveSeriesResult)
                DispatchQueue.main.async {
                    self.seriesTable.reloadData()
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
