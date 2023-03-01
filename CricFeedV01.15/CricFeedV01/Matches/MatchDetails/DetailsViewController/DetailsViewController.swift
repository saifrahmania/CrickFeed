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
    @IBOutlet weak var squad: UIView!
    @IBOutlet weak var scoreboard: UIView!
    @IBOutlet weak var info: UIView!
    @IBOutlet weak var countryOneName: UILabel!
    @IBOutlet weak var countryOneScore: UILabel!
    @IBOutlet weak var countryOneBalls: UILabel!
    @IBOutlet weak var countryTwoName: UILabel!
    @IBOutlet weak var countryTwoScore: UILabel!
    @IBOutlet weak var countryTwoBalls: UILabel!
    @IBOutlet weak var date: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
       // print("Response From Details")
        //dump(receiveDataFromDetails.dataToDetails.value?.data)
        //retrieveDataFromHTTPCalls()
        print("Response from details vc")
        
        ObjectSubject.shared.subscribe(AnySubscriber<DataClass, Never>(
            receiveSubscription: { subscription in
                print("subscription received from Details")
                subscription.request(.unlimited)
            },
            receiveValue: { object in
                print("FixtureId from Details \(object.id)")
                return .unlimited
            }
        ))
    }
    
    @IBAction func detailsSagemnet(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            print("0")
            info.alpha = 1
            squad.alpha = 0
            scoreboard.alpha = 0
            
        } else if sender.selectedSegmentIndex == 1 {
            print("1")
            info.alpha = 0
            squad.alpha = 0
            scoreboard.alpha = 1
        } else {
            print("2")
            info.alpha = 0
            squad.alpha = 1
            scoreboard.alpha = 0
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
