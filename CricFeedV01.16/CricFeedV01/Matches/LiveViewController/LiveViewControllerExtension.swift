//
//  LiveViewControllerExtension.swift
//  CricFeedV01
//
//  Created by BJIT on 21/2/23.
//

import Foundation
import UIKit
import SDWebImage


extension LiveViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(receiveDataForLive.count == 0){
            let emptyTableCell = liveTable.dequeueReusableCell(withIdentifier: Constant.emptyLiveXib, for: indexPath) as? EmptyLive
            return emptyTableCell ?? UITableViewCell()
        } else {
            let liveTableCell = liveTable.dequeueReusableCell(withIdentifier: Constant.matchFinishedCell, for: indexPath) as? MatchFinished
            liveTableCell?.date.text = Constant.calculateDateDifference(dateString: receiveDataForLive[indexPath.row].starting_at!)
            liveTableCell?.venue.text = receiveDataForLive[indexPath.row].venue?.name
            liveTableCell?.resultNote.text = receiveDataForLive[indexPath.row].note
            liveTableCell?.teamOneName.text = receiveDataForLive[indexPath.row].localteam?.code
            liveTableCell?.teamTwoName.text = receiveDataForLive[indexPath.row].visitorteam?.code
            liveTableCell?.teamOneImage.sd_setImage(with: URL(string: (receiveDataForLive[indexPath.row].localteam?.image_path)!), placeholderImage: UIImage(systemName: "pencil"))
            liveTableCell?.teamTwoImage.sd_setImage(with: URL(string: (receiveDataForLive[indexPath.row].visitorteam?.image_path)!), placeholderImage: UIImage(systemName: "pencil"))
            liveTableCell?.finishedBgView.layer.cornerRadius = 10
            if(receiveDataForLive[indexPath.row].status == "NS"){
                liveTableCell?.teamOneBalls.isHidden = true
                liveTableCell?.teamOneScore.isHidden = true
                liveTableCell?.teamTwoBalls.isHidden = true
                liveTableCell?.teamTwoScore.isHidden = true
                liveTableCell?.resultNote.text = "Match has not been started yet"
            } else if(receiveDataForLive[indexPath.row].status == "1st Innings") {
                if((receiveDataForLive[indexPath.row].runs) == nil){
                    liveTableCell?.teamOneBalls.isHidden = true
                    liveTableCell?.teamOneScore.isHidden = true
                    liveTableCell?.teamTwoBalls.isHidden = true
                    liveTableCell?.teamTwoScore.isHidden = true
                    liveTableCell?.resultNote.text = "Batting has not been started yet"
                }  else if(receiveDataForLive[indexPath.row].runs?.count == 1){
                    if(receiveDataForLive[indexPath.row].runs![0].team_id == receiveDataForLive[indexPath.row].localteam?.id){
                        liveTableCell?.teamOneBalls.isHidden = false
                        liveTableCell?.teamOneScore.isHidden = false
                        liveTableCell?.teamTwoBalls.isHidden = true
                        liveTableCell?.teamTwoScore.isHidden = true
                        liveTableCell?.teamOneBalls.text = String(describing: receiveDataForLive[indexPath.row].runs?[0].overs ?? 0)
                        liveTableCell?.teamOneScore.text = String(describing: receiveDataForLive[indexPath.row].runs?[0].score ?? 0)+"/"+String(describing: receiveDataForLive[indexPath.row].runs?[0].wickets ?? 0)
                        //liveTableCell?.teamTwoBalls.text = String(describing: receiveDataForLive[indexPath.row].runs?[1].overs ?? 0)
                        //liveTableCell?.teamTwoScore.text = String(describing: receiveDataForLive[indexPath.row].runs?[1].score ?? 0)+"/"+String(describing: receiveDataForLive[indexPath.row].runs?[1].wickets ?? 0)
                        liveTableCell?.resultNote.text = String(describing: receiveDataForLive[indexPath.row].localteam?.name) + " is batting"
                    } else if (receiveDataForLive[indexPath.row].runs![0].team_id == receiveDataForLive[indexPath.row].visitorteam?.id){
                        liveTableCell?.teamOneBalls.isHidden = true
                        liveTableCell?.teamOneScore.isHidden = true
                        liveTableCell?.teamTwoBalls.isHidden = false
                        liveTableCell?.teamTwoScore.isHidden = false
                        liveTableCell?.teamTwoBalls.text = String(describing: receiveDataForLive[indexPath.row].runs?[0].overs ?? 0)
                        liveTableCell?.teamTwoScore.text = String(describing: receiveDataForLive[indexPath.row].runs?[0].score ?? 0)+"/"+String(describing: receiveDataForLive[indexPath.row].runs?[0].wickets ?? 0)
                        liveTableCell?.resultNote.text = String(describing: receiveDataForLive[indexPath.row].visitorteam?.name) + " is batting"
                    }
                    
                }
            }
            
            else if (receiveDataForLive[indexPath.row].status == "2nd Innings"){
                if(receiveDataForLive[indexPath.row].runs?.count == 2){
                    liveTableCell?.teamOneBalls.isHidden = false
                    liveTableCell?.teamOneScore.isHidden = false
                    liveTableCell?.teamTwoBalls.isHidden = false
                    liveTableCell?.teamTwoScore.isHidden = false
                    liveTableCell?.teamOneBalls.text = String(describing: receiveDataForLive[indexPath.row].runs?[0].overs ?? 0)
                    liveTableCell?.teamOneScore.text = String(describing: receiveDataForLive[indexPath.row].runs?[0].score ?? 0)+"/"+String(describing: receiveDataForLive[indexPath.row].runs?[0].wickets ?? 0)
                    liveTableCell?.teamTwoBalls.text = String(describing: receiveDataForLive[indexPath.row].runs?[1].overs ?? 0)
                    liveTableCell?.teamTwoScore.text = String(describing: receiveDataForLive[indexPath.row].runs?[1].score ?? 0)+"/"+String(describing: receiveDataForLive[indexPath.row].runs?[1].wickets ?? 0)
                }
            }
            
            return liveTableCell ?? UITableViewCell()
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (receiveDataForLive.count == 0){
            return 1
        }else {
           return receiveDataForLive.count
       }
    }
    
    
    
    func retrieveDataFromHTTPCalls(){
        dataFromHTTPCalls.getFixtures(url: Constant.linkForLive){ (countryResult: Result<PreviousMatch,Error>) in
            switch countryResult{
            case .success(let result):
                self.receiveDataForLive = result.data
                //dump(self.receiveFinishedResult)
                //dump(self.receiveFinishedResult)
                DispatchQueue.main.async {
                    self.liveTable.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    } 

    
    
    
}
