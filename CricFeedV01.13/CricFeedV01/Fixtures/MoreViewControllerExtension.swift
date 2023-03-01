//
//  MoreViewControllerExtension.swift
//  CricFeedV01
//
//  Created by BJIT on 25/2/23.
//

import Foundation
import UIKit
import SDWebImage
extension MoreViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            print("Test: \(test.count)")
            return test.count
        } else if section == 1 {
            print("T20: \(t20i.count)")
            return t20i.count
        } else if section == 2 {
            print("ODI: \(odi.count)")
            return odi.count
        }
        print("default 0")
        return 0
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rankingTableCell = rankingTable.dequeueReusableCell(withIdentifier: Constant.rankingXib, for: indexPath) as? Ranking
        
        if indexPath.section == 0{
            rankingTableCell?.teamImage.sd_setImage(with: URL(string: test[indexPath.row].image_path ?? ""), placeholderImage: UIImage(systemName: "pencil"))
            rankingTableCell?.teamName.text = test[indexPath.row].name
            rankingTableCell?.teamPosition.text = String(test[indexPath.row].position ?? 0)
            return rankingTableCell ?? UITableViewCell()
        }
        else if indexPath.section == 1{
            rankingTableCell?.teamImage.sd_setImage(with: URL(string: t20i[indexPath.row].image_path ?? ""), placeholderImage: UIImage(systemName: "pencil"))
            rankingTableCell?.teamName.text = t20i[indexPath.row].name
            rankingTableCell?.teamPosition.text = String(t20i[indexPath.row].position ?? 0)
            return rankingTableCell ?? UITableViewCell()
        }
        else if indexPath.section == 2{
            rankingTableCell?.teamImage.sd_setImage(with: URL(string: odi[indexPath.row].image_path ?? ""), placeholderImage: UIImage(systemName: "pencil"))
            rankingTableCell?.teamName.text = odi[indexPath.row].name
            rankingTableCell?.teamPosition.text = String(odi[indexPath.row].position ?? 0)
            return rankingTableCell ?? UITableViewCell()
        }
        
        return  UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

        
    func dataSeparator(){
        
        for datum in rankingTeam {
            if datum.gender == "men"{
                for team in (datum.team ?? []){
                    var item = RankSeparator()
                    item.name = team.name
                    item.image_path = team.image_path
                    item.matches = team.ranking?.matches
                    item.position = team.position
                    item.points = team.ranking?.points
                    item.rating = team.ranking?.rating
                    if datum.type == "TEST"{
                        test.append(item)
                    }
                    else if datum.type == "ODI"{
                        odi.append(item)
                    }
                    else if datum.type == "T20I"{
                        t20i.append(item)
                    }
                }
            }
        }
    }
        
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 70))
        headerView.backgroundColor = .darkGray
        headerView.layer.cornerRadius = 15
        
        let titleLabel = UILabel(frame: CGRect(x: 10, y: 0, width: tableView.frame.width - 20, height: 30))
        if section == 0 {
            titleLabel.text = "TEST"
            titleLabel.textAlignment = .center
            titleLabel.textColor = .white
            headerView.addSubview(titleLabel)
        } else if section == 1 {
            titleLabel.text = "T20!"
            titleLabel.textColor = .white
            titleLabel.textAlignment = .center
            headerView.addSubview(titleLabel)
        } else if section == 2{
            titleLabel.text = "ODI"
            titleLabel.textColor = .white
            titleLabel.textAlignment = .center
            headerView.addSubview(titleLabel)
        }
        return headerView
    }
    
    
    
}
    
    
    
    


