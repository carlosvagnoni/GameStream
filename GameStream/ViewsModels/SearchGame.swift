//
//  SearchGame.swift
//  GameStream
//
//  Created by user239477 on 5/16/23.
//

import Foundation

class SearchGame: ObservableObject {
    
    @Published var gameInfo = [Game]()
    
    func search(gameName: String, finished: @escaping (_ isSuccess: Bool) -> Void) {
        
        gameInfo.removeAll()
        
        let gameNameSpaces = gameName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        let url = URL(string: "https://gamestreamapi.herokuapp.com/api/games/search?contains=\(gameNameSpaces ?? "cuphead")")!
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
                        
            do {
                
                if let jsonData = data {
                    
                    let decodeData = try
                    JSONDecoder().decode(Results.self, from: jsonData)
                    
                    DispatchQueue.main.async {
                        
                        self.gameInfo.append(contentsOf: decodeData.results)
                        finished(true)
                        
                    }
                    
                }
                
            } catch {
                
                print("Error: \(error)")
                finished(false)
                
            }
            
        }.resume()
        
    }
    
    
    
}
