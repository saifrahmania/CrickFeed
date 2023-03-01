//
//  FixtureViewControllerExtension.swift
//  CricFeedV01
//
//  Created by BJIT on 13/2/23.
//

import UIKit
import SDWebImage

extension FixturesViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        /*let leagueList = ShowLeagueList()
         print("Table Rows: \(leagueList.data?.count ?? 0)")
         return leagueList.data?.count ?? 0*/
        
        print("\(receiveDateResult.count)")
        return receiveDateResult.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200 + 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let fixtureDateCell = fixtureTableView.dequeueReusableCell(withIdentifier: Constant.fixtureDateCell, for: indexPath) as? FixtureDateTable
        //let fixtureSeriesCell = fixtureTableView.dequeueReusableCell(withIdentifier: Constant.fixtureSeriesCell, for: indexPath) as? FixtureSeriesTable
        DispatchQueue.main.async { [self] in
            /*fixtureSeriesCell?.seriesName.text = receiveSeriesFromDataModel[indexPath.row].name
             fixtureSeriesCell?.seriesDate.text = self.calculateDateDifference(dateString: receiveSeriesFromDataModel[indexPath.row].updatedAt ?? "")
             //seriesWiseResult.data?[indexPath.row].updatedAt
             fixtureSeriesCell?.seriesThumb.sd_setImage(with: URL(string: (receiveSeriesFromDataModel[indexPath.row].imagePath)),placeholderImage: UIImage(systemName: "exclamationmark.octagon.fill"))
             */
            fixtureDateCell?.dateTeamOneName.text = receiveDateResult[indexPath.row].localteam?.name
            fixtureDateCell?.dateTeamOneBalls.text = String((receiveDateResult[indexPath.row].runs?[0].overs)!)
            fixtureDateCell?.dateTeamOneScore.text = "\((receiveDateResult[indexPath.row].runs?[0].score)!)/\((receiveDateResult[indexPath.row].runs?[0].wickets)!)"
            fixtureDateCell?.dateTeamOneThumb.sd_setImage(with:URL(string:  (receiveDateResult[indexPath.row].localteam?.imagePath)!))
            fixtureDateCell?.dateTeamTwoName.text = (receiveDateResult[indexPath.row].visitorteam?.name)!
            fixtureDateCell?.dateTeamTwoBalls.text = "(\(receiveDateResult[indexPath.row].runs?[1].overs ?? Double(0.0)) )"
            
            fixtureDateCell?.dateTeamTwoScore.text = "\((receiveDateResult[indexPath.row].runs?[1].score)  ?? Int(0))/\((receiveDateResult[indexPath.row].runs?[1].wickets) ?? Int(0))"
            fixtureDateCell?.dateTeamTwoThumb.sd_setImage(with:URL(string:  (receiveDateResult[indexPath.row].visitorteam?.imagePath)!))
            fixtureDateCell?.dateTournamentName.text = receiveDateResult[indexPath.row].league?.name
            fixtureDateCell?.dateTournamentTime.text = calculateDateDifference(dateString: receiveDateResult[indexPath.row].startingAt!)
            fixtureDateCell?.scoreFromNote.text = receiveDateResult[indexPath.row].note
            
            
        }
        
        
        
        
        
        
        return fixtureDateCell!
    }
    
    
    
    func calculateDateDifference(dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS'Z'"
        guard let date = dateFormatter.date(from: dateString) else { return "" }
        
        let currentDate = Date()
        let difference = currentDate.timeIntervalSince(date)
        let secondsInADay: Double = 60 * 60 * 24
        let days = Int(difference / secondsInADay)
        
        let months = days / 30
        let years = months / 12
        
        if years > 0 {
            return "\(years) years \(months % 12) months \(days % 30) days ago"
        } else if months > 0 {
            return "\(months) months \(days % 30) days ago"
        } else {
            return "\(days) days ago"
        }
    }
    
    func retrieveSeriseMatchData() {
        seriesCompletionHandler.getFixtures{ result in
            self.receiveSeriesResult = result.data
            print("Received from Data Model \(self.receiveSeriesResult.count)")
            DispatchQueue.main.async {
                self.fixtureTableView.reloadData()
            }
        }
    }
    
    func retrieveDateMatchDataModel(){
        dateCompletionHandler.getFixtures{ result in
            self.receiveUpcomingResult = result.data
            DispatchQueue.main.async {
                self.fixtureTableView.reloadData()
            }
        }
    }
    
    func retrieveFromCodableForUpcoming(){
        dataFromCodableForUpcoming.fetchData{ [self] result in
            switch result{
                
            case .success(let upcomingList):
                receiveUpcomingResult = upcomingList.data
                dump(receiveUpcomingResult)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
}

    
extension FixturesViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("Fixture Collection : \(Constant.fixtureSections.count)")
        return Constant.fixtureSections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let fixtureCollection = fixtureCollectionView.dequeueReusableCell(withReuseIdentifier: Constant.matchMenuCell, for: indexPath) as? MatchMenuCell
        fixtureCollection?.menuName.text = Constant.fixtureSections[indexPath.row]
        let colorHex = 0x383838
        let color = UIColor(red: CGFloat((colorHex & 0xFF0000) >> 16) / 255.0, green: CGFloat((colorHex & 0x00FF00) >> 8) / 255.0, blue: CGFloat(colorHex & 0x0000FF) / 255.0, alpha: 0.9)
        fixtureCollection?.menuBackground.backgroundColor = color
        fixtureCollection?.menuName.textColor = .white
        fixtureCollection?.menuBackground.layer.cornerRadius = 7
        return fixtureCollection!
    }
    
    
}
    
    extension FixturesViewController: UICollectionViewDelegateFlowLayout{
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let cellWidth = 150
            return CGSize(width: cellWidth, height: 50)
        }
    }

