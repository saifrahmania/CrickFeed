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
    var receiveDateResult : [Datum] = []
    var receiveUpcomingResult : [DataModelUpcoming] = []
    var cancelableObject = AnyCancellable?.self
    var dataFromCodableForUpcoming = CodableForUpcoming.shared
    @Published var notificationPublisher  : String?
    
    
    
    @IBOutlet weak var fixtureBanner: GradientBackgroundView!
    
    @IBOutlet weak var fixtureCollectionView: UICollectionView!
    
    @IBOutlet weak var fixtureTableView: UITableView!
    let layout = UICollectionViewFlowLayout()
    let seriesCompletionHandler = CodableForLeague.shared
    let dateCompletionHandler = HttpUtility.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        fixtureTableView.dataSource = self
        fixtureTableView.delegate = self
        fixtureCollectionView.dataSource = self
        fixtureCollectionView.delegate = self
        fixtureBanner.layer.cornerRadius = 20
        fixtureBanner.startColor = UIColor(cgColor: CGColor(red: 42, green: 44, blue: 61, alpha: 0.0))
        fixtureBanner.endColor = UIColor(cgColor: CGColor(red: 247, green: 247, blue: 247, alpha: 0.5))
        fixtureBanner.startPoint = CGPoint(x: 0.5, y: 0.5)
        fixtureBanner.endPoint = CGPoint(x: 1.0, y: 1.0)
        let fixtureTableRowForDate = UINib(nibName: Constant.fixtureDateCell, bundle: nil)
        fixtureTableView.register(fixtureTableRowForDate, forCellReuseIdentifier: Constant.fixtureDateCell)
        let fixtureTableRowForSeries = UINib(nibName: Constant.fixtureSeriesCell, bundle: nil)
        fixtureTableView.register(fixtureTableRowForSeries, forCellReuseIdentifier: Constant.fixtureSeriesCell)
        let fixtureMenuBar = UINib(nibName: Constant.matchMenuCell, bundle: nil)
        fixtureCollectionView.register(fixtureMenuBar, forCellWithReuseIdentifier: Constant.matchMenuCell)
        let lineSpacing: CGFloat = 5
        layout.minimumLineSpacing = lineSpacing
        fixtureCollectionView.collectionViewLayout = layout
        //fixtureTableView.backgroundColor = .red
        //retrieveSeriseMatchData()
        //retrieveDateMatchDataModel()
        retrieveFromCodableForUpcoming()
    }
    
    

}




