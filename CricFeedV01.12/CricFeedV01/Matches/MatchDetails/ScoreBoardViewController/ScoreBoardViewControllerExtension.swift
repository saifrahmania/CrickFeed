//
//  ScoreBoardViewControllerExtension.swift
//  CricFeedV01
//
//  Created by BJIT on 24/2/23.
//

import Foundation
extension ScoreboardViewController{
    @objc func handleNotification(_ notification: Notification) {
            guard let dataObject = notification.object as? DataClass else {
                print("scoreboard Data object not found")
                return
            }

            // Use the received data object
        print("scoreboard")
        print("\(dataObject.id), \(dataObject.live)")
        }
}
