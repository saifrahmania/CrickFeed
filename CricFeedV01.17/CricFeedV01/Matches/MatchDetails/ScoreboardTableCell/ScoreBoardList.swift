//
//  ScoreBoardList.swift
//  CricFeedV01
//
//  Created by BJIT on 23/2/23.
//

import UIKit

class ScoreBoardList: UITableViewCell {
    @IBOutlet weak var balls: UILabel!
    
    @IBOutlet weak var rate: UILabel!
    @IBOutlet weak var sixS: UILabel!
    @IBOutlet weak var fourS: UILabel!
    @IBOutlet weak var runs: UILabel!
    @IBOutlet weak var name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
