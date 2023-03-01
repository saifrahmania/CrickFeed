//
//  InfoCellOne.swift
//  CricFeedV01
//
//  Created by BJIT on 23/2/23.
//

import UIKit

class InfoCellOne: UITableViewCell {
    @IBOutlet weak var teamOneImage: UIImageView!
    @IBOutlet weak var teamTwoImage: UIImageView!
    @IBOutlet weak var teamOneName: UILabel!
    @IBOutlet weak var teamTwoName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
