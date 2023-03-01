//
//  TabBarViewController.swift
//  CricFeed
//
//  Created by BJIT on 9/2/23.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //let floatingTabBarView = FloatingTabBarView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: view.bounds.height + 50))
        //view.addSubview(floatingTabBarView)
        changeRadiusOfTab()
        // Do any additional setup after loading the view.
    }
    

    func changeRadiusOfTab() {
        self.tabBar.layer.masksToBounds = true
        self.tabBar.isTranslucent  = false
        //self.tabBar.layer.cornerCurve = .circular
        self.tabBar.layer.cornerRadius = 15
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
    }
    
    func changeUnselectedColor() {
        self.tabBar.unselectedItemTintColor = .systemPink
    }
    
    

}
