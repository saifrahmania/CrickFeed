//
//  MatchFinished.swift
//  CricFeedV01
//
//  Created by BJIT on 21/2/23.
//

import UIKit

class MatchFinished: UITableViewCell {
    @IBOutlet weak var teamOneImage: UIImageView!
    @IBOutlet weak var teamTwoImage: UIImageView!
    @IBOutlet weak var teamOneName: UILabel!
    @IBOutlet weak var teamOneScore: UILabel!
    @IBOutlet weak var teamOneBalls: UILabel!
    @IBOutlet weak var teamTwoName: UILabel!
    @IBOutlet weak var teamTwoScore: UILabel!
    @IBOutlet weak var teamTwoBalls: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var venue: UILabel!
    @IBOutlet weak var resultNote
    : UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
