//
//  CodableForUpcoming.swift
//  CricFeedV01
//
//  Created by BJIT on 15/2/23.
//

import Foundation
import Combine

class CodableForUpcoming {
    static let shared = CodableForUpcoming()
    private init () {}
    let dataFetchingURL = "https://cricket.sportmonks.com/api/v2.0/fixtures?include=visitorteam,localteam,season,league,venue,stage,season,runs,winnerteam&sort=-updated_at&api_token=mYC7mFGDBRtTMmG1Y81Ctv2TFCcf59Kab7Gr4uqBFuELTemcirhfpuLQYyzR"
    func fetchData(completion: @escaping (Result<ShowUpcomingList, Error>) -> Void) {
        guard let url = URL(string: dataFetchingURL) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        
        let session = URLSession.shared.dataTask(with: url){ data, response, error in
            
            if let error  = error{
                print(error.localizedDescription)
                completion(.failure(error))
            }
            else {
                guard let data = data else {
                    return
                }
                
                do {
                    let result  =  try JSONDecoder().decode(ShowUpcomingList.self, from: data)
                    //dump(result)
                    completion(.success(result))
                } catch{
                    print(error.localizedDescription)
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
