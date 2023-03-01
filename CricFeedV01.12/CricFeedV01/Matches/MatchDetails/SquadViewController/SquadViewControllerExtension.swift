//
//  SquadViewControllerExtension.swift
//  CricFeedV01
//
//  Created by BJIT on 24/2/23.
//

import Foundation
import UIKit
extension SquadViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    @objc func handleNotification(_ notification: Notification) {
            guard let dataObject = notification.object as? DataClass else {
                print("squad Data object not found")
                return
            }

            // Use the received data object
        print("squad")
        print("Received data object: name = \(dataObject.id), age = \(dataObject.elected)")
        }
    
}
