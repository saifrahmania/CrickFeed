//
//  MoreViewController.swift
//  CricFeedV01
//
//  Created by BJIT on 10/2/23.
//

import UIKit

class MoreViewController: UIViewController {
    @IBOutlet weak var moreBanner: GradientBackgroundView!
    
    @IBOutlet weak var themeSettings: UIView!
    @IBOutlet weak var notificationSettings: UIView!
    @IBOutlet weak var settingsBody: UIView!
    @IBOutlet weak var settingsView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        moreBanner.layer.cornerRadius = 20
        moreBanner.startColor = UIColor(cgColor: CGColor(red: 42, green: 44, blue: 61, alpha: 0.0))
        moreBanner.endColor = UIColor(cgColor: CGColor(red: 247, green: 247, blue: 247, alpha: 0.5))
        moreBanner.startPoint = CGPoint(x: 0.5, y: 0.0)
        moreBanner.endPoint = CGPoint(x: 1.0, y: 1.0)
        settingsBody.layer.cornerRadius = 15
        settingsView.layer.cornerRadius = 15
        notificationSettings.layer.cornerRadius = 15
        themeSettings.layer.cornerRadius = 15
        

    }
    
    @IBAction func themeChange(_ sender: Any) {
    }
    
    

}
