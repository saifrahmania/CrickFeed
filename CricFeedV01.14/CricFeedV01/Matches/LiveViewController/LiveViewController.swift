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
        let header  = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 30))
        header.backgroundColor = UIColor(cgColor: CGColor(red: 42, green: 44, blue: 61, alpha: 0.0))
        liveTable.tableHeaderView = header

        let liveNib = UINib(nibName: Constant.matchFinishedCell, bundle: nil)
        liveTable.register(liveNib, forCellReuseIdentifier: Constant.matchFinishedCell)
        let emptyNib = UINib(nibName: Constant.emptyLiveXib, bundle: nil)
        liveTable.register(emptyNib, forCellReuseIdentifier: Constant.emptyLiveXib)
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
