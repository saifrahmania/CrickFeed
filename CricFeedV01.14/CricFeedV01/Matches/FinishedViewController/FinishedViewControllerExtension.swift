//
//  FinishedViewControllerExtension.swift
//  CricFeedV01
//
//  Created by BJIT on 21/2/23.
//

import Foundation
import UIKit
import SDWebImage

extension FinishedViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(receiveFinishedResult.count)
        return receiveFinishedResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let finishedTableCell = finishedTable.dequeueReusableCell(withIdentifier: Constant.matchFinishedCell, for: indexPath) as? MatchFinished
        finishedTableCell?.date.text = Constant.calculateDateDifference(dateString: receiveFinishedResult[indexPath.row].starting_at!)
        finishedTableCell?.venue.text = receiveFinishedResult[indexPath.row].venue?.name
        finishedTableCell?.resultNote.text = receiveFinishedResult[indexPath.row].note
        finishedTableCell?.teamOneName.text = receiveFinishedResult[indexPath.row].localteam?.code
        finishedTableCell?.teamTwoName.text = receiveFinishedResult[indexPath.row].visitorteam?.code
        finishedTableCell?.teamOneImage.sd_setImage(with: URL(string: (receiveFinishedResult[indexPath.row].localteam?.image_path)!), placeholderImage: UIImage(systemName: "pencil"))
        finishedTableCell?.teamTwoImage.sd_setImage(with: URL(string: (receiveFinishedResult[indexPath.row].visitorteam?.image_path)!), placeholderImage: UIImage(systemName: "pencil"))
        finishedTableCell?.finishedBgView.layer.cornerRadius = 10
       if(receiveFinishedResult[indexPath.row].runs?.count == 2){
            finishedTableCell?.teamOneBalls.isHidden = false
            finishedTableCell?.teamOneScore.isHidden = false
            finishedTableCell?.teamTwoBalls.isHidden = false
            finishedTableCell?.teamTwoScore.isHidden = false
            finishedTableCell?.teamOneBalls.text = String(describing: receiveFinishedResult[indexPath.row].runs?[0].overs ?? 0)
            finishedTableCell?.teamOneScore.text = String(describing: receiveFinishedResult[indexPath.row].runs?[0].score ?? 0)+"/"+String(describing: receiveFinishedResult[indexPath.row].runs?[0].wickets ?? 0)
            finishedTableCell?.teamTwoBalls.text = String(describing: receiveFinishedResult[indexPath.row].runs?[1].overs ?? 0)
            finishedTableCell?.teamTwoScore.text = String(describing: receiveFinishedResult[indexPath.row].runs?[1].score ?? 0)+"/"+String(describing: receiveFinishedResult[indexPath.row].runs?[1].wickets ?? 0)
            
        } else {
            finishedTableCell?.teamOneBalls.isHidden = true
            finishedTableCell?.teamOneScore.isHidden = true
            finishedTableCell?.teamTwoBalls.isHidden = true
            finishedTableCell?.teamTwoScore.isHidden = true
            finishedTableCell?.resultNote.text = "Result has not been updated"
        }
        
        
        return finishedTableCell ?? UITableViewCell()
    }
    
    
    func retrieveDataFromHTTPCalls(){
        dataFromHTTPCalls.getFixtures(url: Constant.linkForFinished){ (countryResult: Result<PreviousMatch,Error>) in
            switch countryResult{
            case .success(let result):
                self.receiveFinishedResult = result.data
                //dump(self.receiveFinishedResult)
                //dump(self.receiveFinishedResult)
                DispatchQueue.main.async {
                    self.finishedTable.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Details", bundle: nil)
        if let detailsVC = storyboard.instantiateViewController(withIdentifier: Constant.DetailsViewController) as? DetailsViewController {
            let name = NSNotification.Name(Constant.finishedNotification)
            HttpUtility.shared.getFixtures(url: Constant.detailsAPILink+String(self.receiveFinishedResult[indexPath.row].id ?? 0)+Constant.detailsAPIIncluded){ data in
                Constant.detailsData = data.data
                
                NotificationCenter.default.post(name: name, object: Constant.detailsData ?? DataClass())
                DispatchQueue.main.async {
                    
                    self.navigationController?.pushViewController(detailsVC, animated: true)
                }
            }
            
            
        }
        
            
            
            
            //detailsVC.receiveDataFromDetails.getIdWiseDetails(id: receiveFinishedResult[indexPath.row].id ?? 0)
            //= String(describing: )
            //receiveFinishedResult[indexPath.row].id)
            //                detailsVC.loadViewIfNeeded()
            //                self.navigationController?.pushViewController(detailsVC, animated: true)
        }
    }
    
   
    
    


/* func calculateDateDifference(dateString: String) -> String {
     let dateFormatter = DateFormatter()
     dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS'Z'"
     dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
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
 }*/
