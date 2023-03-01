//
//  HttpUtility.swift
//  CricFeed
//
//  Created by BJIT on 9/2/23.
//

import Foundation


class HttpUtility {
    static let shared = HttpUtility()
    private init () {}
    let dataFetchingURL = "https://cricket.sportmonks.com/api/v2.0/fixtures?include=visitorteam,localteam,season,league,venue,stage,season,runs,winnerteam&sort=-updated_at&api_token=mYC7mFGDBRtTMmG1Y81Ctv2TFCcf59Kab7Gr4uqBFuELTemcirhfpuLQYyzR"
    func getFixtures(_ completion: @escaping (ShowUpcomingList)->Void)  {
        guard let url = URL(string: dataFetchingURL) else {
            return
        }
        
        let session = URLSession.shared.dataTask(with: url){ data, response, error in
            
            if let error  = error{
                print(error.localizedDescription)
            }
            else {
                guard let data = data else {
                    return
                }
                
                do {
                    let result  =  try JSONDecoder().decode(ShowUpcomingList.self, from: data)
                    dump(result)
                    completion(result)
                } catch{
                    print(error.localizedDescription)
                }
                
            }
        }.resume()
    }
}


