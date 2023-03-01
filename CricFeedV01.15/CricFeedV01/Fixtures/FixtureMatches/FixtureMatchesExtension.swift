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
        for datas in receiveDateResult{
            if datas.league_id == 3 {
                firstSecCount += 1
            } else if datas.league_id == 5{
                secondSecCount += 1
            } else if datas.league_id == 10 {
                thirdSecCount += 1
            }
        }
        
        if section == 0 {
            return firstSecCount
        } else if section == 1 {
            return secondSecCount
        } else if section == 2 {
            return thirdSecCount
        }
        
        return 100
    }
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let fixtureTableCell = fixtureMatchesTable.dequeueReusableCell(withIdentifier: Constant.fixtureDateCell, for: indexPath) as! FixtureDateTable
        if(indexPath.row < receiveDateResult.count && receiveDateResult[indexPath.row].runs?.count == 2){
            print(receiveDateResult[indexPath.row].id)
            fixtureTableCell.dateTournamentTime.text = Constant.convertDateFormat(receiveDateResult[indexPath.row].starting_at ?? "")
            fixtureTableCell.dateTeamOneName.text = receiveDateResult[indexPath.row].localteam?.name
            fixtureTableCell.dateTeamTwoName.text = receiveDateResult[indexPath.row].visitorteam?.name
            fixtureTableCell.dateTeamOneScore.text = String(receiveDateResult[indexPath.row].runs?[0].score ?? 0) + "/" + String(receiveDateResult[indexPath.row].runs?[0].wickets ?? 0)
            fixtureTableCell.dateTeamTwoScore.text = String(receiveDateResult[indexPath.row].runs?[1].score ?? 0) + "/" + String(receiveDateResult[indexPath.row].runs?[1].wickets ?? 0)
            fixtureTableCell.dateTeamOneBalls.text = String(receiveDateResult[indexPath.row].runs?[0].overs ?? 0)
            fixtureTableCell.dateTeamTwoBalls.text = String(receiveDateResult[indexPath.row].runs?[1].overs ?? 0)
            fixtureTableCell.scoreFromNote.text = receiveDateResult[indexPath.row].note
            fixtureTableCell.dateTeamOneThumb.sd_setImage(with: URL(string: receiveDateResult[indexPath.row].localteam?.image_path ?? ""))
            fixtureTableCell.dateTeamTwoThumb.sd_setImage(with: URL(string: receiveDateResult[indexPath.row].visitorteam?.image_path ?? ""))
            
        }
        
        return fixtureTableCell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 70))
        let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 30, height: 30))
            //imageView.sd_setImage(with: URL(string: <#T##String#>))
        
        headerView.backgroundColor = .darkGray
        headerView.layer.cornerRadius = 15
        
        let titleLabel = UILabel(frame: CGRect(x: 10, y: 0, width: tableView.frame.width - 20, height: 30))
        if section == 0 {
            titleLabel.text = "Twenty20 International"
            titleLabel.textAlignment = .center
            imageView.sd_setImage(with: URL(string: "https://cdn.sportmonks.com/images/cricket/leagues/3/3.png"))
            titleLabel.textColor = .white
            headerView.addSubview(titleLabel)
        } else if section == 1 {
            titleLabel.text = "Big Bash League"
            titleLabel.textColor = .white
            imageView.sd_setImage(with: URL(string: "https://cdn.sportmonks.com/images/cricket/leagues/5/5.png"))
            titleLabel.textAlignment = .center
            headerView.addSubview(titleLabel)
        } else if section == 2{
            titleLabel.text = "CSA T20 Challenge"
            titleLabel.textColor = .white
            imageView.sd_setImage(with: URL(string: "https://cdn.sportmonks.com/images/cricket/leagues/10/10.png"))
            titleLabel.textAlignment = .center
            headerView.addSubview(titleLabel)
            headerView.addSubview(imageView)
        }
        return headerView
    }
    
    /*
     // Create a custom UIView for the table header
     let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))

     // Create an image view and set its image
     let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 30, height: 30))
     imageView.image = UIImage(named: "your-image")

     // Create a label and set its text
     let label = UILabel(frame: CGRect(x: 50, y: 10, width: tableView.frame.width - 50, height: 30))
     label.text = "Your Title"

     // Add the image view and label to the header view
     headerView.addSubview(imageView)
     headerView.addSubview(label)

     // Set the header view of the table view
     tableView.tableHeaderView = headerView

     
     
     */
    
   /* func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let matchTableCell = fixtureMatchesTable.dequeueReusableCell(withIdentifier: Constant.fixtureDateCell, for: indexPath) as? FixtureDateTable
        matchTableCell?.dateTournamentTime.text = Constant.calculateDateDifference(dateString: receiveDateResult[indexPath.row].starting_at! )
        matchTableCell?.dateTeamOneName.text = receiveDateResult[indexPath.row].localteam?.code
        matchTableCell?.dateTeamTwoName.text = receiveDateResult[indexPath.row].visitorteam?.code
        matchTableCell?.dateTeamOneThumb.sd_setImage(with: URL(string: (receiveDateResult[indexPath.row].localteam?.image_path)! ), placeholderImage: UIImage(systemName: "pencil"))
        matchTableCell?.dateTeamTwoThumb.sd_setImage(with: URL(string: (receiveDateResult[indexPath.row].visitorteam?.image_path)! ), placeholderImage: UIImage(systemName: "pencil"))
        if (receiveDateResult[indexPath.row].runs.count == 2){
            
            //+ "\nStartingDate:" + String(describing: receiveDateResult[indexPath.row].starting_at)+
            matchTableCell?.dateTeamOneScore.text = String(describing: receiveDateResult[indexPath.row].runs[0].score ?? 0) + "/"+String(describing: receiveDateResult[indexPath.row].runs[0].wickets ?? 0)
            matchTableCell?.dateTeamOneBalls.text = String(describing: receiveDateResult[indexPath.row].runs[0].overs ?? 0)
            matchTableCell?.dateTeamTwoScore.text = String(describing: receiveDateResult[indexPath.row].runs[1].score ?? 0) + "/" + String(describing: receiveDateResult[indexPath.row].runs[1].wickets ?? 0)
            matchTableCell?.dateTeamTwoBalls.text = String(describing: receiveDateResult[indexPath.row].runs[1].overs ?? 0)
            matchTableCell?.scoreFromNote.text = receiveDateResult[indexPath.row].note!
            print("if case\nFixture:"+String(describing: receiveDateResult[indexPath.row].id ?? 0)+"\nStartingDate:" + String(describing: matchTableCell?.dateTournamentTime.text)+"\nRunCount:"+String(describing: receiveDateResult[indexPath.row].runs[0].score ?? 0)+"\nTeam1: "+String(describing: receiveDateResult[indexPath.row].localteam?.code)+"\nRun: "+String(describing: receiveDateResult[indexPath.row].runs[0].score)+"\nTeam2: "+String(describing: receiveDateResult[indexPath.row].visitorteam?.code)+"\nRun: "+String(describing: receiveDateResult[indexPath.row].runs[1].score)+"\nScore:"+String(describing: receiveDateResult[indexPath.row].note)+"\nTournament"+String(describing: receiveDateResult[indexPath.row].league?.name))
            matchTableCell?.dateTeamOneScore.isHidden = false
            matchTableCell?.dateTeamOneBalls.isHidden = false
            matchTableCell?.dateTeamTwoScore.isHidden = false
            matchTableCell?.dateTeamTwoBalls.isHidden = false
            matchTableCell?.scoreFromNote.isHidden = false
            
        } else {
            print("else case\nFixture:"+String(describing: receiveDateResult[indexPath.row].id ?? 0)+"\nRunCount:"+String(describing: receiveDateResult[indexPath.row].runs.count ) + "\nStartingDate:" + String(describing: matchTableCell?.dateTournamentTime.text)+"\nTeam1: "+String(describing: receiveDateResult[indexPath.row].localteam?.code)+"\nTeam2: "+String(describing: receiveDateResult[indexPath.row].visitorteam?.code)+"\nTournament"+String(describing: receiveDateResult[indexPath.row].league?.name))
            matchTableCell?.dateTeamOneScore.isHidden = true
            matchTableCell?.dateTeamOneBalls.isHidden = true
            matchTableCell?.dateTeamTwoScore.isHidden = true
            matchTableCell?.dateTeamTwoBalls.isHidden = true
            matchTableCell?.scoreFromNote.isHidden = true
        }
        
        
        
        return matchTableCell ?? UITableViewCell()
    }*/
    
    func retrieveDataFromHTTPCalls()  {
        dataFromHTTPCalls.getFixtures(url:Constant.linkForLeagueWiseMatch){(countryResult: Result<LeagueWiseMatch,Error>) in
            switch countryResult{
                
            case .success(let result):
                self.receiveDateResult = result.data
                //dump(self.receiveDateResult)
                DispatchQueue.main.async {
                    self.fixtureMatchesTable.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
   /* func calculateDateDifference(dateString: String) -> String {
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
    } */
    
}
