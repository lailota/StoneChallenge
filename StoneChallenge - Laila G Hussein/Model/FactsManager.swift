//
//  FactsManager.swift
//  StoneChallenge - Laila G Hussein
//
//  Created by Laila Guzzon Hussein Lailota on 14/07/21.
//

import Foundation

class FactsManager {
    
    public static let factsManager = FactsManager()
    public var factsArray: [Fact] = []
    public var totalAct = 0
    
    func getFacts(_ fact: String?, completion: @escaping (Result<Response,Error>) -> Void) {
        
        guard let fact = fact else {
            return
        }
        
        // Create a URL object
        guard let url = URL(string: "https://api.chucknorris.io/jokes/search?query=\(fact)") else {
            return
        }
        
        // Get a URLSession object
        let session = URLSession.shared
        
        // Get a data task from the URlSession object
        let task = session.dataTask(with: url) { (data, response, error) in
            
            let decoder = JSONDecoder()
            
            // Check if there were any errors
            if let data = data {
                do {
                    
                    // Parsing the data
                    let result = try decoder.decode(Response.self, from: data)
                    
                    for factData in result.result {

                        let storedFact: Fact = Fact(categories: factData.categories, created_at: factData.created_at, icon_url: factData.icon_url, id: factData.id, updated_at: factData.updated_at, url: factData.url, value: factData.value)

                        self.factsArray.append(storedFact)
                        self.totalAct = self.factsArray.count
                    }
                    
                }
                catch {
                    //print(completion(.failure(error)))
                    print("Estou vazio")
                }
                
            } else if let error = error {
                //completion(.failure(error))
                print(error)
            }

        }
        // Kick off the task
        task.resume()
    }
    
    
}
