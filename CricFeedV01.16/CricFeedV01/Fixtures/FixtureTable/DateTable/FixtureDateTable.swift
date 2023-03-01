//
//  FixtureDateTable.swift
//  CricFeedV01
//
//  Created by BJIT on 11/2/23.
//

import UIKit

class FixtureDateTable: UITableViewCell {
    
    @IBOutlet weak var fixDateTableBg: UIView!
    @IBOutlet weak var dateTournamentTime: UILabel!
    
    @IBOutlet weak var dateTeamOneThumb: UIImageView!
    
    @IBOutlet weak var dateTeamOneName: UILabel!
    
    @IBOutlet weak var dateTeamOneScore: UILabel!
    
    @IBOutlet weak var dateTeamOneBalls: UILabel!
    
    @IBOutlet weak var dateTeamTwoThumb: UIImageView!
    
    @IBOutlet weak var dateTeamTwoName: UILabel!
    
    @IBOutlet weak var dateTeamTwoScore: UILabel!
    
    @IBOutlet weak var dateTeamTwoBalls: UILabel!
    
    
    @IBOutlet weak var scoreFromNote: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        fixDateTableBg.layer.cornerRadius = 10
        //fixDateTableBg.backgroundColor = .clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
}
