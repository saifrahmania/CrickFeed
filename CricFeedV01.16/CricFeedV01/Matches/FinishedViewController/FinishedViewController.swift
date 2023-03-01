//
//  FinishedViewController.swift
//  CricFeedV01
//
//  Created by BJIT on 17/2/23.
//

import UIKit

class FinishedViewController: UIViewController{
    var dataFromHTTPCalls = HTTPCalls.share
    var receiveFinishedResult:[DataModelPerevious] = []
        var sendDataToDetails:DataClass?

    @IBOutlet weak var finishedTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        finishedTable.dataSource = self
        finishedTable.delegate = self

        let finishedNib = UINib(nibName: Constant.matchFinishedCell, bundle: nil)
        finishedTable.register(finishedNib, forCellReuseIdentifier: Constant.matchFinishedCell)
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
