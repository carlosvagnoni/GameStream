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
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 40, trailing: 0))
                    
                    
                    Text("Tus Favoritos")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.bottom, 30)
                    
                }
 
                
                ScrollView {
                    
                    //ForEach(allGames.gamesInfo, id: \.self) { game in
                    
                    ForEach(allGames.gamesInfo.filter({ favoritesManager.favorites.contains($0.title) }), id: \.self) { game in
                        
                        GameRow(
                            playerViewModel: VideoPlayerViewModel(url: URL(string: game.videosUrls.mobile)!),
                            game: game
                        )
                        
                    }
                    
                }
                
            }
            
            
        }
        
    }
    
}

struct GameRow: View {
    
    @StateObject var playerViewModel: VideoPlayerViewModel
    
    @State private var isRemoveFavoriteButtonActive = false
    
    @EnvironmentObject var favoritesManager: FavoritesManager
    
    let game: Game

    var body: some View {
        
        ZStack {
            
            VStack(spacing: 0) {
                
                ZStack {
                    
                    VideoPlayer(player: playerViewModel.player)
                        .aspectRatio(16/9, contentMode: .fit)
                    
                    VStack {
                        
                        if isRemoveFavoriteButtonActive {
                            
                            Button {
                                
                                favoritesManager.removeFavorite(gameTitle: game.title)
                                
                            } label: {
                                
                                HStack {
                                    
                                    Text("Eliminar de mis favoritos")
                                        .foregroundColor(.white)
                                        .font(.headline)
                                    
                                    Image(systemName: "xmark")
                                        .foregroundColor(.white)
                                        .font(.title3)
                                        .frame(alignment: .topTrailing)
                                }
                                .padding(10)
                                .background(Color("blue-gray"))
                                .clipShape(Capsule())
                                .overlay(Capsule().stroke(Color.white, lineWidth: 1))
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 10))
                }
                
                HStack {
                    
                    Text("\(game.title)")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .frame(height: 40)
                        .font(.headline)
                        .padding(.leading, 10)
                    
                    Spacer()
                    
                    Button {
                        
                        isRemoveFavoriteButtonActive.toggle()
                        
                    } label: {
                        
                        if isRemoveFavoriteButtonActive {
                            
                            Image(systemName: "ellipsis.circle.fill")
                                .foregroundColor(.white)
                                .font(.title)
                            
                        } else {
                            
                            Image(systemName: "ellipsis.circle")
                                .foregroundColor(.white)
                                .font(.title)
                            
                        }
                    }
                    .padding(.trailing, 5)
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .background(Color("blue-gray"))
                .padding(.bottom, 10)
            }
        }
        .padding(.horizontal, 20)
    }
}

struct FavoritesView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        FavoritesView()
            .environmentObject(FavoritesManager())
            
        
    }
}
