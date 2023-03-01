//
//  SquadViewController.swift
//  CricFeedV01
//
//  Created by BJIT on 22/2/23.
//

import UIKit

class SquadViewController: UIViewController {

    @IBOutlet weak var squadTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        print("Response from team squad vc")
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification(_:)), name: Notification.Name(Constant.finishedNotification), object: nil)
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
