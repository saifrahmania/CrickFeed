//
//  UpcomingTable.swift
//  CricFeedV01
//
//  Created by BJIT on 20/2/23.
//

import UIKit

class UpcomingTable: UITableViewCell {
    
    @IBOutlet weak var upcomingDate: UILabel!
    
    @IBOutlet weak var upcomingTeamOneName: UILabel!
    
    @IBOutlet weak var upcomingTeamOneThumb: UIImageView!
    
    @IBOutlet weak var upcomingTeamTwoName: UILabel!
    
    @IBOutlet weak var upcomingTeamTwoThumb: UIImageView!
    
    @IBOutlet weak var upcomingVenue: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
