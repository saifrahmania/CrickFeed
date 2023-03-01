//
//  MatchesViewControllerExtension.swift
//  CricFeedV01
//
//  Created by BJIT on 13/2/23.
//

import UIKit

extension MatchesViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

extension MatchesViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(Constant.matchesSection.count)
        return Constant.matchesSection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let matchCollection = matchSection.dequeueReusableCell(withReuseIdentifier: Constant.matchMenuCell, for: indexPath) as! MatchMenuCell
        matchCollection.menuName.text = Constant.matchesSection[indexPath.row]
        matchCollection.menuName.textColor = .white
        let colorHex = 0x383838
        let color = UIColor(red: CGFloat((colorHex & 0xFF0000) >> 16) / 255.0, green: CGFloat((colorHex & 0x00FF00) >> 8) / 255.0, blue: CGFloat(colorHex & 0x0000FF) / 255.0, alpha: 0.9)

        matchCollection.menuBackground.backgroundColor = color
        matchCollection.menuBackground.layer.cornerRadius = 7
        
        
        //print("\(Constant.matchMenuCell[indexPath.row])")
        return matchCollection
        
        
    }
    
    
}

extension MatchesViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = view.frame.width / 3.7
        return CGSize(width: cellWidth, height: 50)
    }
    
    
}
