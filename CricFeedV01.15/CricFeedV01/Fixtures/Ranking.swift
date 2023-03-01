//
//  Ranking.swift
//  CricFeedV01
//
//  Created by BJIT on 25/2/23.
//

import UIKit

class Ranking: UITableViewCell {
    
   
    @IBOutlet weak var teamImage: UIImageView!
    
    @IBOutlet weak var teamName: UILabel!
    
    
    @IBOutlet weak var teamPosition: UILabel!  
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
