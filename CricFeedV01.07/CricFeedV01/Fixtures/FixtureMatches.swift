//
//  FixtureMatches.swift
//  CricFeedV01
//
//  Created by BJIT on 17/2/23.
//

import UIKit

class FixtureMatches: UIViewController {

    @IBOutlet weak var fixtureMatches: UITableView!
    var receiveDateResult : [DatumAll] = []
    var dataFromHTTPCalls = HTTPCalls.share
    override func viewDidLoad() {
        super.viewDidLoad()
        fixtureMatches.dataSource = self
        fixtureMatches.delegate = self
        let fixtureMatchNib = UINib(nibName: Constant.fixtureDateCell, bundle: nil)
        fixtureMatches.register(fixtureMatchNib, forCellReuseIdentifier: Constant.fixtureDateCell)
        retrieveDataFromHTTPCalls()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}