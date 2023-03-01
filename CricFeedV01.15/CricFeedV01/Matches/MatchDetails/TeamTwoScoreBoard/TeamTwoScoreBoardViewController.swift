//
//  TeamTwoScoreBoardViewController.swift
//  CricFeedV01
//
//  Created by BJIT on 22/2/23.
//

import UIKit
import Combine

class TeamTwoScoreBoardViewController: UIViewController {

    @IBOutlet weak var teamTwoScoreboard: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Response from team two vc")        
        ObjectSubject.shared.subscribe(AnySubscriber<DataClass, Never>(
            receiveSubscription: { subscription in
                subscription.request(.unlimited)
            },
            receiveValue: { object in
                print("FixtureId from TeamTwoScoreBoard \(object.id)")
                return .unlimited
            }
        ))
        let teamTwoScoreXib = UINib(nibName: Constant.scoreboardXib, bundle: nil)
        teamTwoScoreboard.register(teamTwoScoreXib, forCellReuseIdentifier: Constant.scoreboardXib)
        
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
