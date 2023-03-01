//
//  HTTPCalls.swift
//  CricFeedV01
//
//  Created by BJIT on 16/2/23.
//

import Foundation
class HTTPCalls{
    static let share = HTTPCalls()
    private init () {}
   
    func getFixtures<T:Codable>(url:String, _ completion: @escaping (Result<T,Error>)->Void)  {
        guard let url = URL(string: url) else {
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
                    let result  =  try JSONDecoder().decode(T.self, from: data)
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
