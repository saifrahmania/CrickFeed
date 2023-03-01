//
//  SquadList.swift
//  CricFeedV01
//
//  Created by BJIT on 23/2/23.
//

import UIKit

class SquadList: UITableViewCell {

    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
