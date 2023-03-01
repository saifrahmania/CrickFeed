//
//  FixturesViewController.swift
//  CricFeedV01
//
//  Created by BJIT on 10/2/23.
//

import UIKit
import Combine

class FixturesViewController: UIViewController {
    
    
    var receiveSeriesResult : [Datum2] = []
    //var receiveDateResult : [Datum] = []
    //var receiveUpcomingResult : [DataModelUpcoming] = []
    
    var cancelableObject = AnyCancellable?.self
    var dataFromCodableForUpcoming = CodableForUpcoming.shared
    var dataFromHTTPCalls = HTTPCalls.share
    @Published var notificationPublisher  : String?
    @IBOutlet weak var fixtureBanner: GradientBackgroundView!
    

    @IBOutlet weak var fixtureSeries: UIView!
    @IBOutlet weak var fixtureMatches: UIView!
    
    let layout = UICollectionViewFlowLayout()    
    let dateCompletionHandler = HttpUtility.shared
    override func viewDidLoad() {
        super.viewDidLoad()
      
        fixtureBanner.layer.cornerRadius = 20
        fixtureBanner.startColor = UIColor(cgColor: CGColor(red: 42, green: 44, blue: 61, alpha: 0.0))
        fixtureBanner.endColor = UIColor(cgColor: CGColor(red: 247, green: 247, blue: 247, alpha: 0.5))
        fixtureBanner.startPoint = CGPoint(x: 0.5, y: 0.5)
        fixtureBanner.endPoint = CGPoint(x: 1.0, y: 1.0)
//
       // retrieveDataFromHTTPCalls()
    }
    
    @IBAction func switchViews(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            fixtureSeries.alpha = 1
            fixtureMatches.alpha = 0
            
        }
        else {
            fixtureSeries.alpha = 0
            fixtureMatches.alpha = 1
        }
    }
    
    

}




