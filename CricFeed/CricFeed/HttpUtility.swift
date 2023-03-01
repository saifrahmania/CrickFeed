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
    let dataFetchingURL = "https://cricket.sportmonks.com/api/v2.0/fixtures?fields[fixtures]=note&filter[season_id]=6&include=visitorteam,localteam,season,league,venue,stage,season&sort=-updated_at&filter[league_id]=3&api_token=mYC7mFGDBRtTMmG1Y81Ctv2TFCcf59Kab7Gr4uqBFuELTemcirhfpuLQYyzR"
    func getFixtures()  {
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
                    let result  =  try JSONDecoder().decode(FixtureHandler.self, from: data)
                    dump(result)
                } catch{
                    print(error.localizedDescription)
                }
                
            }
        }.resume()
    }
}
