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
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        layer.shadowRadius = 25.0
        layer.shadowOpacity = 0.3
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
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors =  [CGColor(red: 42, green: 44, blue: 61, alpha: 0.0),CGColor(red: 247, green: 247, blue: 247, alpha: 0.5)]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        tabBar.layer.addSublayer(gradientLayer)
    }

}


/*
 //[UIColor.red.cgColor,UIColor.blue.cgColor]  CGColor(red: 56, green: 44, blue: 118, alpha: 0.1)
 //layer.fillColor = CGColor(genericCMYKCyan: 0.88, magenta: 0.74, yellow: 0.47, black: 0.6, alpha: 0.9)
 //UIColor.init(red: 24, green: 31, blue: 45, alpha: 100)
 //UIColor.separator.cgColor
 
 
 */
