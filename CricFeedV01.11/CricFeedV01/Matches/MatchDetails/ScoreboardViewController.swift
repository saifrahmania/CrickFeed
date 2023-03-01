//
//  ScoreboardViewController.swift
//  CricFeedV01
//
//  Created by BJIT on 22/2/23.
//

import UIKit

class ScoreboardViewController: UIViewController {
    @IBOutlet weak var teamOneScoreboardView: UIView!
    
    @IBOutlet weak var teamTwoScoreboaredView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func teamScoreSegment(_ sender: UISegmentedControl) {
        if( sender.selectedSegmentIndex == 0){
            teamOneScoreboardView.alpha = 1
            teamTwoScoreboaredView.alpha = 0
        } else {
            teamOneScoreboardView.alpha = 0
            teamTwoScoreboaredView.alpha = 1
        }
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
