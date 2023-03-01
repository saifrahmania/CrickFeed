//
//  DetailsViewControllerExtension.swift
//  CricFeedV01
//
//  Created by BJIT on 23/2/23.
//

import Foundation
import UIKit
extension DetailsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if workingIndex == 0{
            if section == 0{
                return 1
                
            } else if section == 1{
                return 1
                
            } else if section == 2{
                return 1
            } else if section == 3 {
                return 1
            } else if section == 4 {
                return 1
            }
        } else if workingIndex == 1{
            if section == 0 {
                return DetailsViewController.sendToInfo?.batting?.count ?? 0
            } else if section == 1{
                return DetailsViewController.sendToInfo?.bowling?.count ?? 0
            }
            
        } else if workingIndex == 2 {
            if section == 0 {
                return DetailsViewController.sendToInfo?.lineup?.count ?? 0
            }
        }
        return 0
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if workingIndex == 0{
            return 5
        } else if workingIndex == 1{
            return 2
        }  else if workingIndex == 2 {
            return 1
        }
        return 9
    }
    
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 70))
        
        headerView.backgroundColor = .darkGray
        headerView.layer.cornerRadius = 10
        
        let titleLabel = UILabel(frame: CGRect(x: 10, y: 0, width: tableView.frame.width - 20, height: 30))
        if workingIndex == 0{
            if section == 0 {
                titleLabel.text = "Toss Winner"
                titleLabel.textAlignment = .center
                titleLabel.textColor = .white
                headerView.addSubview(titleLabel)
            } else if section == 1 {
                titleLabel.text = "Match Winner"
                titleLabel.textAlignment = .center
                titleLabel.textColor = .white
                headerView.addSubview(titleLabel)
            } else if section == 2 {
                titleLabel.text = "Venue"
                titleLabel.textAlignment = .center
                titleLabel.textColor = .white
                headerView.addSubview(titleLabel)
            } else if section == 3 {
                titleLabel.text = "Stage"
                titleLabel.textAlignment = .center
                titleLabel.textColor = .white
                headerView.addSubview(titleLabel)
            } else if section == 4 {
                titleLabel.text = "Result"
                titleLabel.textAlignment = .center
                titleLabel.textColor = .white
                headerView.addSubview(titleLabel)
            }
        } else if workingIndex == 1 {
            if section == 0 {
                titleLabel.text = "Batting"
                titleLabel.textAlignment = .center
                titleLabel.textColor = .white
                headerView.addSubview(titleLabel)
            } else if section == 1 {
                titleLabel.text = "Bowling"
                titleLabel.textAlignment = .center
                titleLabel.textColor = .white
                headerView.addSubview(titleLabel)
            }
        } else if workingIndex == 2 {
            if section == 0 {
                titleLabel.text = "Squad"
                titleLabel.textAlignment = .center
                titleLabel.textColor = .white
                headerView.addSubview(titleLabel)
            }
        }
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let infoCell = detailsTable.dequeueReusableCell(withIdentifier: Constant.infoTableCell, for: indexPath) as! InfoCell
        let scoreboardCell = detailsTable.dequeueReusableCell(withIdentifier: Constant.scoreboardXib, for: indexPath) as! ScoreBoardList
        let squadCell  = detailsTable.dequeueReusableCell(withIdentifier: Constant.squadTableCell, for: indexPath) as! SquadList
        if workingIndex == 0 {
            if indexPath.section == 0{
                infoCell.infoCellText.text = DetailsViewController.sendToInfo?.tosswon?.name
            } else if indexPath.section == 1 {
                infoCell.infoCellText.text = DetailsViewController.sendToInfo?.winnerteam?.name
            } else if indexPath.section == 2 {
                infoCell.infoCellText.text = DetailsViewController.sendToInfo?.venue?.name
            } else if indexPath.section == 3 {
                infoCell.infoCellText.text = DetailsViewController.sendToInfo?.stage?.name
            } else if indexPath.section == 4 {
                infoCell.infoCellText.text = DetailsViewController.sendToInfo?.note
            }
            return infoCell
        } else if workingIndex == 1 {
            if indexPath.section == 0 {
                //titleLabel.text = "Batting"
                scoreboardCell.name.text = DetailsViewController.sendToInfo?.batting?[indexPath.row].batsman?.lastname
                scoreboardCell.runs.text = String(DetailsViewController.sendToInfo?.batting?[indexPath.row].score ?? 0)
                scoreboardCell.balls.text = String(DetailsViewController.sendToInfo?.batting?[indexPath.row].ball ?? 0)
                scoreboardCell.fourS.text = String(DetailsViewController.sendToInfo?.batting?[indexPath.row].four_x ?? 0)
                scoreboardCell.sixS.text = String(DetailsViewController.sendToInfo?.batting?[indexPath.row].six_x ?? 0)
                scoreboardCell.rate.text = String(DetailsViewController.sendToInfo?.batting?[indexPath.row].rate ?? 0)
                return scoreboardCell
                
            } else if indexPath.section == 1 {
                //itleLabel.text = "Bowling"
                scoreboardCell.name.text = DetailsViewController.sendToInfo?.bowling?[indexPath.row].bowler?.lastname
                scoreboardCell.runs.text = String(DetailsViewController.sendToInfo?.bowling?[indexPath.row].overs ?? 0)
                scoreboardCell.balls.text = String(DetailsViewController.sendToInfo?.bowling?[indexPath.row].medians ?? 0)
                scoreboardCell.fourS.text = String(DetailsViewController.sendToInfo?.bowling?[indexPath.row].runs ?? 0)
                scoreboardCell.sixS.text = String(DetailsViewController.sendToInfo?.bowling?[indexPath.row].wickets ?? 0)
                scoreboardCell.rate.text = String(DetailsViewController.sendToInfo?.bowling?[indexPath.row].rate ?? 0)
                return scoreboardCell
                
            }
        }
        if workingIndex == 2 {
            if indexPath.section == 0 {
                
                squadCell.playerName.text = DetailsViewController.sendToInfo?.lineup?[indexPath.row].lastname
                squadCell.playerImage.sd_setImage(with: URL(string: DetailsViewController.sendToInfo?.lineup?[indexPath.row].image_path ?? ""), placeholderImage: UIImage(systemName: "pencil"))
                return squadCell
            }
        }
        
        return UITableViewCell()
    }
    
    
    
}




