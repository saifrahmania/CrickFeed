//
//  FixtureSeriesExtension.swift
//  CricFeedV01
//
//  Created by BJIT on 17/2/23.
//

import Foundation
import UIKit

extension FixtureSeries: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return receiveSeriesResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = seriesTable.dequeueReusableCell(withIdentifier: Constant.fixtureSeriesCell, for: indexPath) as? FixtureSeriesTable
        
        tableCell?.seriesDate.text = Constant.calculateDateDifference(dateString: receiveSeriesResult[indexPath.row].updated_at ?? "2022-12-29T12:26:45.000000Z")
        tableCell?.seriesName.text = receiveSeriesResult[indexPath.row].name
        tableCell?.seriesThumb.sd_setImage(with: URL(string:  receiveSeriesResult[indexPath.row].image_path), placeholderImage: UIImage(systemName: "pencil"))
        return tableCell!
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func retrieveDataFromHTTPCalls()  {
        dataFromHTTPCalls.getFixtures(url:Constant.fetchSeriesList){(countryResult: Result<ShowLeagueList,Error>) in
            switch countryResult{
                
            case .success(let result):
                self.receiveSeriesResult = result.data
                dump(self.receiveSeriesResult)
                DispatchQueue.main.async {
                    self.seriesTable.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
