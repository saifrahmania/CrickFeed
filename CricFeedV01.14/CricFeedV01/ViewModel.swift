//
//  ViewModel.swift
//  CricFeedV01
//
//  Created by BJIT on 24/2/23.
//

import Foundation


class ViewModel{
    static var shared = ViewModel()
    private init() {}
    var dataToDetails: ObservableObject<DetailsModel2?> = ObservableObject(nil)
    var dataFromHttpUtility = HttpUtility.shared
    
    func getIdWiseDetails(id: Int){
        var sendingURL = Constant.detailsAPILink + String(id) + Constant.detailsAPIIncluded
        print("Sending URL: \(sendingURL)")
        dataFromHttpUtility.getFixtures(url: sendingURL){ [weak self] data in
            self?.dataToDetails.value = data
            
        }
    }
}
