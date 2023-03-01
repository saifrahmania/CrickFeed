//
//  CodableForLeague.swift
//  CricFeedV01
//
//  Created by BJIT on 13/2/23.
//

import Foundation


class CodableForLeague {
    static let shared = CodableForLeague()
    private init () {}
    let dataFetchingURL = "\(Constant.apiLink)/leagues?sort=-updated_at&api_token=\(Constant.apiToken)"
    
    func getFixtures(_ completion: @escaping (ShowLeagueList) -> ())  {
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
                    let result  =  try JSONDecoder().decode(ShowLeagueList.self, from: data)
                    completion(result)
                } catch{
                    print(error.localizedDescription)
                }
                
            }
        }.resume()
    }
}

