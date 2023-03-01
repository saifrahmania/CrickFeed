//
//  InfoViewController.swift
//  CricFeedV01
//
//  Created by BJIT on 22/2/23.
//

import UIKit

class InfoViewController: UIViewController {
    static let sharedInfo = InfoViewController()
    static var infoData:DataClass?
    @IBOutlet weak var infoTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        infoTable.dataSource = self
        infoTable.delegate = self
        print("dumping DetailsViewController.sendToInfo")

        
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
