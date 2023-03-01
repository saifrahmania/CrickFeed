//
//  TabBarViewController.swift
//  CricFeedV01
//
//  Created by BJIT on 10/2/23.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let layer = CAShapeLayer()
        layer.path = UIBezierPath(roundedRect: CGRect(x: 20, y: tabBar.bounds.minY , width: tabBar.bounds.width - 40, height: tabBar.bounds.height + 10), cornerRadius: (tabBar.frame.width/2)).cgPath
        layer.shadowColor = UIColor.white.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        layer.backgroundColor = UIColor.white.cgColor
        layer.shadowRadius = 100.0
        layer.shadowOpacity = 0
        layer.borderWidth = 1.0
        layer.opacity = 1.0
        layer.isHidden = false
        layer.masksToBounds = false
        
      
        tabBar.layer.insertSublayer(layer, at: 0)

        if let items = tabBar.items {
            items.forEach { item in
                item.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -15, right: 0)
            }
        }

        tabBar.itemWidth = 70.0
        tabBar.itemPositioning = .centered
        
      }
    
}


