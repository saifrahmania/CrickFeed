//
//  ViewController.swift
//  CricFeed
//
//  Created by BJIT on 9/2/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        HttpUtility.shared.getFixtures()
    }


}

