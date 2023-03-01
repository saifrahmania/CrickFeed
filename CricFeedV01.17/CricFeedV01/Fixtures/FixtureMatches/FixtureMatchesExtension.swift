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
    
   
    
}
