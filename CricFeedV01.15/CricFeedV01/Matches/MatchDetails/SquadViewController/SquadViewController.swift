//
//  SquadViewController.swift
//  CricFeedV01
//
//  Created by BJIT on 22/2/23.
//

import UIKit
import Combine

class SquadViewController: UIViewController {

    @IBOutlet weak var squadTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        print("Response from team squad vc")
        ObjectSubject.shared.subscribe(AnySubscriber<DataClass, Never>(
            receiveSubscription: { subscription in
                print("subscription received from squad")
                subscription.request(.unlimited)
            },
            receiveValue: { object in
                print("FixtureId from Squad \(object.id)")
                return .unlimited
            }
        ))
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
