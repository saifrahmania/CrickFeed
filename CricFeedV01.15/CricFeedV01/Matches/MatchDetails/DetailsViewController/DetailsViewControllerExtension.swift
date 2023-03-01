//
//  DetailsViewControllerExtension.swift
//  CricFeedV01
//
//  Created by BJIT on 23/2/23.
//

import Foundation
extension DetailsViewController{
    
    
    
    
    
    
   /* func retrieveDataFromHTTPCalls(){
        print(storeFixtureId)
        let apiCaller = Constant.detailsAPILink+storeFixtureId+Constant.detailsAPIIncluded
        print(apiCaller)
        dataFromHTTPCalls.getFixtures(url: apiCaller ){ (countryResult: Result<DetailsModel2,Error>) in
            switch countryResult{
            case .success(let result):
                self.receiveDataFromDetails = result.data
                DetailsViewController.sendToInfo = result.data
                InfoViewController.infoData = result.data
                print("Response From Details Class")
                //dump(DetailsViewController.sendToInfo)
                //dump(self.receiveDataFromDetails)
                //dump(self.receiveFinishedResult)
                DispatchQueue.main.async { [self] in
                    //self.<#TableName#>.reloadData()
                    date.text = Constant.convertDateFormat(receiveDataFromDetails?.starting_at ?? "")
                    countryOneName.text = receiveDataFromDetails?.localteam?.code
                    countryTwoName.text = receiveDataFromDetails?.visitorteam?.code
                    if(receiveDataFromDetails?.runs?.count == 2){
                        if(receiveDataFromDetails?.runs?[0].team_id == receiveDataFromDetails?.localteam_id){
                            countryOneScore.text = String(receiveDataFromDetails?.runs?[0].score ?? 0)+"/"+String(receiveDataFromDetails?.runs?[0].wickets ?? 0)
                            countryOneBalls.text = String(receiveDataFromDetails?.runs?[0].overs ?? 0)
                            countryTwoScore.text = String(receiveDataFromDetails?.runs?[1].score ?? 0)+"/"+String(receiveDataFromDetails?.runs?[1].wickets ?? 0)
                            countryTwoBalls.text = String(receiveDataFromDetails?.runs?[1].overs ?? 0)
                        } else {
                            countryOneScore.text = String(receiveDataFromDetails?.runs?[1].score ?? 0)+"/"+String(receiveDataFromDetails?.runs?[1].wickets ?? 0)
                            countryOneBalls.text = String(receiveDataFromDetails?.runs?[1].overs ?? 0)
                            countryTwoScore.text = String(receiveDataFromDetails?.runs?[0].score ?? 0)+"/"+String(receiveDataFromDetails?.runs?[0].wickets ?? 0)
                            countryTwoBalls.text = String(receiveDataFromDetails?.runs?[0].overs ?? 0)
                        }
                    }
                    //InfoViewController.sharedInfo.infoTable.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }*/
}
