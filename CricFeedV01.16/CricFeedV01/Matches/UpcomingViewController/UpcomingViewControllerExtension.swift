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
        = Constant.calculateDateDifference(dateString: receiveUpcomingResult[indexPath.row].starting_at ?? "")
        upcomingTableCell?.upcomingTeamOneName.text = receiveUpcomingResult[indexPath.row].visitorteam?.code
        upcomingTableCell?.upcomingTeamOneThumb.sd_setImage(with: URL(string: (receiveUpcomingResult[indexPath.row].visitorteam?.image_path)!), placeholderImage: UIImage(systemName: "pencil"))
        upcomingTableCell?.upcomingTeamTwoName.text = receiveUpcomingResult[indexPath.row].localteam?.code
        upcomingTableCell?.upcomingTeamTwoThumb.sd_setImage(with: URL(string: (receiveUpcomingResult[indexPath.row].localteam?.image_path)!), placeholderImage: UIImage(systemName: "pencil"))
        upcomingTableCell?.upcomingVenue.text = receiveUpcomingResult[indexPath.row].venue?.name
        upcomingTableCell?.upcomingView.layer.cornerRadius = 10
        
        
        return upcomingTableCell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
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
    

    
}
