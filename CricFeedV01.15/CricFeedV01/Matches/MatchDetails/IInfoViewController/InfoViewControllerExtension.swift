//
//  InfoViewControllerExtension.swift
//  CricFeedV01
//
//  Created by BJIT on 23/2/23.
//

import Foundation
import UIKit
import SDWebImage

extension InfoViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let infoCellOne = infoTable.dequeueReusableCell(withIdentifier: "infoCellOne") as! InfoCellOne
        let infoCellTwo = infoTable.dequeueReusableCell(withIdentifier: "infoCellTwo") as! InfoCellTwo
        let infoCellThree = infoTable.dequeueReusableCell(withIdentifier: "infoCellThree") as! InfoCellThree
        /*
         if(indexPath.section == 0){
         infoCellOne.teamOneImage.sd_setImage(with: URL(string: (InfoViewController.infoData?.localteam?.image_path) ?? ""), placeholderImage: UIImage(systemName: "pencil"))
         infoCellOne.teamOneName.text = InfoViewController.infoData?.localteam?.name
         infoCellOne.teamTwoImage.sd_setImage(with: URL(string: (InfoViewController.infoData?.visitorteam?.image_path) ?? ""), placeholderImage: UIImage(systemName: "pencil"))
         return infoCellOne
         } else if(indexPath.section == 1){
         if(InfoViewController.infoData?.toss_won_team_id == InfoViewController.infoData?.localteam_id){
         infoCellTwo.tossResult.text = "\(InfoViewController.infoData?.localteam?.name) won the toss"
         } else {
         infoCellTwo.tossResult.text = "\(InfoViewController.infoData?.visitorteam?.name) won the toss"
         
         }
         return infoCellTwo
         } else{
         if(InfoViewController.infoData?.winner_team_id == InfoViewController.infoData?.localteam_id){
         infoCellThree.winningResult.text = "\(InfoViewController.infoData?.localteam?.name) won the match"
         } else {
         infoCellThree.winningResult.text = "\(InfoViewController.infoData?.visitorteam?.name) won the match"
         
         }
         return infoCellThree
         }
         
         
         }*/
        
        return UITableViewCell()
        
        
    }
}
