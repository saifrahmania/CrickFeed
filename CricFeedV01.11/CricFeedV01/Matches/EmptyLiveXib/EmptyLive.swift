//
//  EmptyLive.swift
//  CricFeedV01
//
//  Created by BJIT on 22/2/23.
//

import UIKit

class EmptyLive: UITableViewCell {
    @IBOutlet weak var noLiveBgView: UIView!
    
    @IBOutlet weak var noLiveLabel: UILabel!
    @IBOutlet weak var noLiveImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
