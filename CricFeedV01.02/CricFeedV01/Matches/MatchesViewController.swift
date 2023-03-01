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
    @IBOutlet weak var matchLive: UIView!
    @IBOutlet weak var matchUpcomming: UIView!
    @IBOutlet weak var matchFinished: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        bannerView.layer.cornerRadius = 20
        bannerView.startColor = UIColor(cgColor: CGColor(red: 42, green: 44, blue: 61, alpha: 0.0))
        bannerView.endColor = UIColor(cgColor: CGColor(red: 247, green: 247, blue: 247, alpha: 0.5))
        bannerView.startPoint = CGPoint(x: 0.5, y: 0.5)
        bannerView.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        
    }
    
    @IBAction func searchBtn(_ sender: Any) {
        
    }
    @IBAction func switchScreen(_ sender: UISegmentedControl){
        if sender.selectedSegmentIndex == 0 {
            matchLive.alpha = 1
            matchUpcomming.alpha = 0
            matchFinished.alpha = 0
        } else if sender.selectedSegmentIndex == 1 {
            matchLive.alpha = 0
            matchUpcomming.alpha = 1
            matchFinished.alpha = 0
        } else {
            matchLive.alpha = 0
            matchUpcomming.alpha = 0
            matchFinished.alpha = 1
        }
            
    }
    
    
    

    

}
