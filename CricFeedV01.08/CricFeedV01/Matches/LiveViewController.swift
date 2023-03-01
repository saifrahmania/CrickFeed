//
//  LiveViewController.swift
//  CricFeedV01
//
//  Created by BJIT on 17/2/23.
//

import UIKit

class LiveViewController: UIViewController {

    @IBOutlet weak var liveTable: UITableView!
    var dataFromHTTPCalls = HTTPCalls.share
    var receiveDataForLive:[DataModelPerevious] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        liveTable.dataSource = self
        liveTable.delegate = self

        let liveNib = UINib(nibName: Constant.matchFinishedCell, bundle: nil)
        liveTable.register(liveNib, forCellReuseIdentifier: Constant.matchFinishedCell)
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
