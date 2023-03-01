//
//  FixtureSeries.swift
//  CricFeedV01
//
//  Created by BJIT on 17/2/23.
//

import UIKit

class FixtureSeries: UIViewController{

    @IBOutlet weak var seriesTable: UITableView!
    var dataFromHTTPCalls = HTTPCalls.share
    var receiveSeriesResult : [Datum2] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        seriesTable.dataSource = self
        seriesTable.delegate = self
        retrieveDataFromHTTPCalls()
        let seriesTableCell = UINib(nibName: Constant.fixtureSeriesCell, bundle: nil)
        seriesTable.register(seriesTableCell, forCellReuseIdentifier: Constant.fixtureSeriesCell)
        
    }
    

    
    

}
