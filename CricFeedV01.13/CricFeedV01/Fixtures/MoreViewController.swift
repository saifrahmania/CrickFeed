//
//  MoreViewController.swift
//  CricFeedV01
//
//  Created by BJIT on 10/2/23.
//

import UIKit

class MoreViewController: UIViewController {
    @IBOutlet weak var moreBanner: GradientBackgroundView!
    
    var t20i:[RankSeparator] = []
    var odi:[RankSeparator] = []
    var test:[RankSeparator] = []
    var rankingTeam: [DataModel] = []
    @IBOutlet weak var rankingTable: UITableView!
    @IBOutlet weak var settingsView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        moreBanner.layer.cornerRadius = 20
        moreBanner.startColor = UIColor(cgColor: CGColor(red: 42, green: 44, blue: 61, alpha: 0.0))
        moreBanner.endColor = UIColor(cgColor: CGColor(red: 247, green: 247, blue: 247, alpha: 0.5))
        moreBanner.startPoint = CGPoint(x: 0.5, y: 0.0)
        moreBanner.endPoint = CGPoint(x: 1.0, y: 1.0)
        rankingTable.dataSource = self
        rankingTable.delegate = self
        let rankingXib = UINib(nibName: Constant.rankingXib, bundle: nil)
        rankingTable.register(rankingXib, forCellReuseIdentifier: Constant.rankingXib)
        
        HTTPCalls.share.getFixtures(url: Constant.linkForRanking){ [weak self] (countryResult: Result<TeamRanking,Error>) in
            
            switch countryResult{
            case .success(let result):
                self?.rankingTeam = result.data
                print("Dumping RankingTeam")
                dump(self?.rankingTeam)
                DispatchQueue.main.async {
                    self?.dataSeparator()
                    self?.rankingTable.reloadData()
                }
            case .failure( let error):
                print(error.localizedDescription)
            }
            
        }
        
            
    

    }
    
    
    
    

}
