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
    
    func getFixtures(url: String,_ completion: @escaping (DetailsModel2)->Void)  {
        guard let url = URL(string: url) else {
            
            return
        }
        print("URL from Utility \(url)")
        let session = URLSession.shared.dataTask(with: url){ data, response, error in
            
            if let error  = error{
                print(error.localizedDescription)
            }
            else {
                guard let data = data else {
                    return
                }
                
                do {
                    let result  =  try JSONDecoder().decode(DetailsModel2.self, from: data)
                    print("Response From Utility")
                    dump(result)
                    completion(result)
                } catch{
                    print("Error From Utility")
                    print(error.localizedDescription)
                }
                
            }
        }.resume()
    }
}


