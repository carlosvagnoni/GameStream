//
//  FavoritesView.swift
//  GameStream
//
//  Created by user239477 on 5/19/23.
//

import SwiftUI
import AVKit

struct FavoritesView: View {
    
    @EnvironmentObject var favoritesManager: FavoritesManager
    
    @ObservedObject var allGames = ViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("marine")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                VStack(spacing: 0) {
                    
                    HStack(spacing: 0.0) {
                        Image("appLogoController")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 23)
                            .padding(.trailing, 10.0)
                        Image("appLogo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        .frame(width: 170)
                    }
                    .padding(.bottom, 40)
                    
                    Text("Tus Favoritos")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.bottom, 30)
                    
                }
 
                
                ScrollView {
                    
                    ForEach(allGames.gamesInfo.filter({ favoritesManager.favorites.contains($0.title) }), id: \.self) { game in
                        
                        VStack(spacing: 0) {
                            
                            VideoPlayer(player: AVPlayer(url: URL(string: game.videosUrls.mobile)!))
                                .frame(height: 218)
                            
                            Text("\(game.title)")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .frame(height: 40)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .font(.headline)
                                .padding(.leading, 10)
                                .background(Color("blue-gray"))
                                .padding(.bottom, 10)
                            
                        }
                        .padding(.horizontal, 20)
                        
                    }
                    
                }
                
            }
            
            
        }
        
    }
    
}

struct FavoritesView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        FavoritesView()
            .environmentObject(FavoritesManager())
        
    }
}
