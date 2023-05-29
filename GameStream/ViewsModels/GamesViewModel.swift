//
//  ViewModel.swift
//  GameStream
//
//  Created by user239477 on 5/12/23.
//

import Foundation

class GamesViewModel: ObservableObject {
    
    @Published var gamesInfo = [Game]()
    
    init() {
        
        let url = URL(string: "https://gamestreamapi.herokuapp.com/api/games")!
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            do {
                
                if let jsonData = data {
                    
                    let decodeData = try
                    JSONDecoder().decode([Game].self, from: jsonData)
                    
                    DispatchQueue.main.async {
                        
                        self.gamesInfo.append(contentsOf: decodeData)
                        
                    }
                    
                }
                
            } catch {
                
                print("Error: \(error)")
                
            }
            
        }.resume()
        
    }
    
}
