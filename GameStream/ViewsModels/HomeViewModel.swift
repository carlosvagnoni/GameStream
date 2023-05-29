//
//  HomeViewModel.swift
//  GameStream
//
//  Created by user239477 on 5/28/23.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var isGameViewActive = false
    @Published var activeAlert: GameAlert?
    
    var foundGame = SearchGame()
    
    func watchGame(name: String, url: Binding<String>, title: Binding<String>, studio: Binding<String>, contentRaiting: Binding<String>, publicationYear: Binding<String>, description: Binding<String>, platforms: Binding<[String]>, tags: Binding<[String]>, galleryImages: Binding<[String]>) {

        
        foundGame.search(gameName: name) { finished in
            
            if finished {
                
                DispatchQueue.main.async {
                                        
                    if self.foundGame.gameInfo.count == 0 {
                        
                        self.activeAlert = .gameNotFound
                        
                    } else {
                        
                        url.wrappedValue = self.foundGame.gameInfo[0].videosUrls.mobile
                        title.wrappedValue = self.foundGame.gameInfo[0].title
                        studio.wrappedValue = self.foundGame.gameInfo[0].studio
                        contentRaiting.wrappedValue = self.foundGame.gameInfo[0].contentRaiting
                        publicationYear.wrappedValue = self.foundGame.gameInfo[0].publicationYear
                        description.wrappedValue = self.foundGame.gameInfo[0].description
                        platforms.wrappedValue = self.foundGame.gameInfo[0].platforms
                        tags.wrappedValue = self.foundGame.gameInfo[0].tags
                        galleryImages.wrappedValue = self.foundGame.gameInfo[0].galleryImages
                        
                        self.isGameViewActive = true
                        
                    }
                    
                }
                
            } else {
                
                DispatchQueue.main.async {
                    
                    self.activeAlert = .gameNotFound
                    
                }
            }
            
        }
        
    }
}

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

