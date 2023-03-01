//
//  MatchesViewController.swift
//  CricFeedV01
//
//  Created by BJIT on 10/2/23.
//

import UIKit


class MatchesViewController: UIViewController {
    let layout = UICollectionViewFlowLayout()
    
    @IBOutlet weak var bannerView: GradientBackgroundView!
    
    @IBOutlet weak var matchScore: UITableView!
    @IBOutlet weak var matchSection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        bannerView.layer.cornerRadius = 20
        bannerView.startColor = UIColor(cgColor: CGColor(red: 42, green: 44, blue: 61, alpha: 0.0))
        bannerView.endColor = UIColor(cgColor: CGColor(red: 247, green: 247, blue: 247, alpha: 0.5))
        bannerView.startPoint = CGPoint(x: 0.5, y: 0.5)
        bannerView.endPoint = CGPoint(x: 1.0, y: 1.0)
        matchSection.dataSource = self
        matchSection.delegate = self
        matchScore.dataSource = self
        matchScore.delegate = self
        let upcomingTable = UINib(nibName: Constant.matchFinishedCell, bundle: nil)
        matchScore.register(upcomingTable, forCellReuseIdentifier: Constant.matchFinishedCell)
        let matchMenuCell = UINib(nibName: Constant.matchMenuCell, bundle: nil)
        matchSection.register(matchMenuCell, forCellWithReuseIdentifier: Constant.matchMenuCell)
        layout.scrollDirection = .horizontal
        matchSection.collectionViewLayout = layout
        
    }
    
    @IBAction func searchBtn(_ sender: Any) {
        
    }
    
    
    

    

}
