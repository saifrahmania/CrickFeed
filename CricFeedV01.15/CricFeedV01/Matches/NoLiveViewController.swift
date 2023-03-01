//
//  NoLiveViewController.swift
//  CricFeedV01
//
//  Created by BJIT on 22/2/23.
//

import UIKit
import SDWebImage

class NoLiveViewController: UIViewController {

    @IBOutlet weak var noLiveLabel: UILabel!
    @IBOutlet weak var noLiveImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        noLiveLabel.text = "No Live Match is available at this moment"
        noLiveImage.sd_setImage(with: URL(string: "https://cdn.icon-icons.com/icons2/1365/PNG/512/forbidden_89359.png"), placeholderImage: UIImage(systemName: "pencil"))
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
