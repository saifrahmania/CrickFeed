//
//  DetailsViewController.swift
//  CricFeedV01
//
//  Created by BJIT on 20/2/23.
//

import UIKit
import Combine

class DetailsViewController: UIViewController {
    
    var dataFromHTTPCalls = HTTPCalls.share
    var receiveDataFromDetails = ViewModel.shared
    static var sendToInfo:DataClass?
    var workingIndex = 0
    @IBOutlet weak var detailsTable: UITableView!
    @IBOutlet weak var countryOneName: UILabel!
    @IBOutlet weak var countryOneScore: UILabel!
    @IBOutlet weak var countryOneBalls: UILabel!
    @IBOutlet weak var countryTwoName: UILabel!
    @IBOutlet weak var countryTwoScore: UILabel!
    @IBOutlet weak var countryTwoBalls: UILabel!
    @IBOutlet weak var date: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsTable.dataSource = self
        detailsTable.delegate = self
       
        print("Response from details vc")
        let infoCell = UINib(nibName: Constant.infoTableCell, bundle: nil)
        detailsTable.register(infoCell, forCellReuseIdentifier: Constant.infoTableCell)
        let scoreboardCell = UINib(nibName: Constant.scoreboardXib, bundle: nil)
        detailsTable.register(scoreboardCell, forCellReuseIdentifier: Constant.scoreboardXib)
        let squadCell = UINib(nibName: Constant.squadTableCell, bundle: nil)
        detailsTable.register(squadCell, forCellReuseIdentifier: Constant.squadTableCell)
        countryOneName.text = DetailsViewController.sendToInfo?.localteam?.name
        countryTwoName.text = DetailsViewController.sendToInfo?.visitorteam?.name
        date.text = Constant.convertDateFormat(DetailsViewController.sendToInfo?.starting_at ?? "")
        if DetailsViewController.sendToInfo?.runs?.count == 2 {
            countryOneBalls.text = String(DetailsViewController.sendToInfo?.runs?[0].overs ?? 0)
            countryTwoBalls.text = String(DetailsViewController.sendToInfo?.runs?[1].overs ?? 0)
            countryOneScore.text = String(DetailsViewController.sendToInfo?.runs?[0].score ?? 0)+"/"+String(DetailsViewController.sendToInfo?.runs?[0].wickets ?? 0)
            countryTwoScore.text = String(DetailsViewController.sendToInfo?.runs?[1].score ?? 0)+"/"+String(DetailsViewController.sendToInfo?.runs?[1].wickets ?? 0)
            
        } else {
            
            countryOneBalls.text = ""
            countryTwoBalls.text = ""
            countryOneScore.text = ""
            countryTwoScore.text = ""
        }
        
       
    }
    
    @IBAction func detailsSagemnet(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            workingIndex = 0
            print("0")
            detailsTable.reloadData()
            
            
        } else if sender.selectedSegmentIndex == 1 {
            workingIndex = 1
            print("1")
            detailsTable.reloadData()
            
        } else {
            workingIndex = 2
            print("2")
            detailsTable.reloadData()
           
        }
    }
    
    

}
