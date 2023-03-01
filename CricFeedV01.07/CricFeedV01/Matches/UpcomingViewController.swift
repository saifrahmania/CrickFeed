//
//  UpcomingViewController.swift
//  CricFeedV01
//
//  Created by BJIT on 17/2/23.
//

import UIKit

class UpcomingViewController: UIViewController {
    
    @IBOutlet weak var upcomingTable: UITableView!
    var receiveUpcomingResult: [DataUpcoming] = []
    var dataFromHTTPCalls = HTTPCalls.share
    override func viewDidLoad() {
        super.viewDidLoad()
        upcomingTable.dataSource = self
        upcomingTable.delegate = self

        let upcomingNib = UINib(nibName: Constant.upcomingTable, bundle: nil)
        upcomingTable.register(upcomingNib, forCellReuseIdentifier: Constant.upcomingTable)
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
