//
//  FixtureSeriesTable.swift
//  CricFeedV01
//
//  Created by BJIT on 11/2/23.
//

import UIKit

class FixtureSeriesTable: UITableViewCell {
    @IBOutlet weak var seriesThumb: UIImageView!
    
    @IBOutlet weak var seriesView: UIView!
    @IBOutlet weak var seriesDate: UILabel!
    @IBOutlet weak var seriesName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        seriesView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
