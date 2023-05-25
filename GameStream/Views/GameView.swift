//
//  GameView.swift
//  GameStream
//
//  Created by user239477 on 5/13/23.
//

import SwiftUI
import AVKit

struct GameView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @EnvironmentObject var favoritesManager: FavoritesManager
    
    @State private var favorite: Bool = false
    
    var url: String
    
    var title: String
    
    var studio: String
    
    var contentRaiting: String
    
    var publicationYear: String
    
    var description: String
    
    var platforms: [String]
    
    var tags: [String]
    
    var galleryImages: [String]
    
    var body: some View {
        
        ZStack {
            
            Color("marine")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                ScrollView {
                    
                    GameVideo(url: url)
                        .aspectRatio(contentMode: .fill)
                        .ignoresSafeArea()
                    
                    VStack(spacing: 0) {
                        
                        VideoInfo(favorite: $favorite, title: title, studio: studio, contentRaiting: contentRaiting, publicationYear: publicationYear, description: description, platforms: platforms, tags: tags)
                        
                        GalleryImages(galleryImages: galleryImages)
                        
                        Comments(gameTitleFilter: title)
                        
                        SimilarGames()
                        
                    }
                    .padding(.horizontal, 20)
                    
                }
                .frame(maxWidth: .infinity)
                .ignoresSafeArea(.all, edges: .top)
            }
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true) 
        .overlay(

            Button {
                
                dismiss()
                
            } label: {
                
                Image(systemName: "chevron.left")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 40, trailing: 0)),
            alignment: .topLeading
        )
        .onChange(of: title) { newValue in
            favorite = favoritesManager.isFavorite(gameTitle: newValue)
        }
        
    }
        
}

struct GameVideo: View {
    
    var url: String
    
    private var videoURL: URL? {
            return URL(string: url)
        }

        var body: some View {
            
            if let validURL = videoURL {
                
                VideoPlayer(player: AVPlayer(url: validURL))
                    .aspectRatio(16/9, contentMode: .fit)
                    .onDisappear {
                        AVPlayer(url: validURL).pause()
                    }
                
            }
            
        }
}

struct VideoInfo: View {
    
    @EnvironmentObject var favoritesManager: FavoritesManager
    
    @Binding var favorite: Bool
    
    var title: String
    
    var studio: String
    
    var contentRaiting: String
    
    var publicationYear: String
    
    var description: String
    
    var platforms: [String]
    
    var tags: [String]
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            HStack(spacing: 0) {
                
                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Spacer()
                
                Button {
                    
                    favorite.toggle()
                    
                    if favorite {
                        
                        favoritesManager.addFavorite(gameTitle: title)
                        
                    } else {
                        
                        favoritesManager.removeFavorite(gameTitle: title)
                        
                    }
                    
                } label: {
                    
                    if favorite {
                        
                        Image(systemName: "heart.fill")
                            .foregroundColor(.white)
                            .font(.title2)
                        
                    } else {
                        
                        Image(systemName: "heart")
                            .foregroundColor(.white)
                            .font(.title2)
                        
                    }
                }

                
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 10)
            
            HStack {
                
                Text(studio)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.trailing, 10)
                
                Text(contentRaiting)
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(.trailing, 10)
                
                Text(publicationYear)
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(.trailing, 10)
                
                Spacer()
                
            }
            .padding(.bottom, 10)
            
            ScrollView(.horizontal) {
                
                HStack {
                    
                    ForEach(platforms, id: \.self) {
                        platform in
                        
                        ZStack {
                            
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("blue-gray"))
                            
                            
                            Text("\(platform)")
                                .font(.title2)
                                .foregroundColor(.white)
                            .padding(8)
                            
                        }
                            
                    }
                }
                
            }
            .padding(.bottom, 20)
            
            
            
            Text(description)
                .font(.title3)
                .foregroundColor(.white)
                .padding(.bottom, 10)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.horizontal) {
                
                HStack {
                    
                    ForEach(tags, id: \.self) {
                        platform in
                        
                        ZStack {
                            
                            Capsule()
                                .fill(Color("dark-cian").opacity(0.5))
                            
                            
                            Text("\(platform)")
                                .font(.title3)
                                .foregroundColor(.white)
                            .padding(10)
                            
                        }
                            
                    }
                }
                
            }
            .padding(.bottom, 30)
            
            
        }
        
    }
}

struct GalleryImages: View {
    
    var galleryImages: [String]
    
    let gridForm = [
    
        GridItem(.flexible())
        
    ]
    
    var body: some View {
        
        Text("GALERÍA")
            .font(.title2)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding(.bottom, 15)
        
        ScrollView(.horizontal) {
            
            LazyHGrid(rows: gridForm, spacing: 10) {
                
                ForEach(galleryImages, id: \.self) {
                    image in
                    
                    if let imageURL = URL(string: image) {
                        AsyncImage(url: imageURL) { img in
                            img
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        } placeholder: {
                            ProgressView()
                        }
                        
                    }
                    
                }
            }
            
        }
        .padding(.bottom, 30)
        .frame(maxHeight: 200)
        
        
    }
}

struct Comments: View {
    
    let gameTitleFilter: String
    
    var filteredData: [CommentsTableData] {
            CommentsData.filterByGameTitle(gameTitleFilter: gameTitleFilter)
        }
    
    var body: some View {
        
        Text("COMENTARIOS")
            .font(.title2)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding(.bottom, 15)
        
        VStack(spacing: 0) {
            
            ForEach(filteredData, id: \.self) {
                comment in
                
                ZStack {
                    
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color("blue-gray"))
                    
                    VStack(spacing: 0) {
                        
                        HStack {
                            
                            Image("\(comment.authorProfilePhoto)")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .padding(15)
                            
                            VStack(spacing: 0) {
                                
                                Text("\(comment.author)")
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                    .padding(.bottom, 8)
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                
                                Text("\(comment.commentDate)")
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                                
                            }
                            .padding(0)
                            
                        }
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                        Text("\(comment.comment)")
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 0, leading: 15, bottom: 15, trailing: 15))
                        
                    }
                    
                }
                .padding(.bottom, 10)
                
            }
            
        }
        .padding(.bottom, 20)
    }
}

struct SimilarGames: View {
    
    var body: some View {
        
        Text("JUEGOS SIMILARES")
            .font(.title2)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding(.bottom, 15)
        
        ScrollView(.horizontal, showsIndicators: false) {
                        
                        HStack {
                            
                            Button {
                                
                                print("Ir a juego 1")
                                
                            } label: {
                                
                                Image("tlouii")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(8)
                                
                            }
                            
                            Button {
                                
                                print("Ir a juego 2")
                                
                            } label: {
                                
                                Image("destiny")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(8)
                                
                            }
                            
                            Button {
                                
                                print("Ir a juego 3")
                                
                            } label: {
                                
                                Image("spiderman")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(8)
                                
                            }
                            
                            Button {
                                
                                print("Ir a juego 4")
                                
                            } label: {
                                
                                Image("titanfall2")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(8)
                                
                            }
                            
                            Button {
                                
                                print("Ir a juego 5")
                                
                            } label: {
                                
                                Image("uncharted4")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(8)
                                
                            }
                            
                            Button {
                                
                                print("Ir a juego 6")
                                
                            } label: {
                                
                                Image("assassinscreed")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(8)
                                
                            }
                            
                            Button {
                                
                                print("Ir a juego 7")
                                
                            } label: {
                                
                                Image("farcry4")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(8)
                                
                            }
                            
                            Button {
                                
                                print("Ir a juego 8")
                                
                            } label: {
                                
                                Image("battlefield6")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(8)
                                
                            }

                            
                        }
                        
                    }
        .frame(maxHeight: 150)
        
    }
}

struct GameView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        GameView(url: "ejemplo", title: "Crash Bandicoot™ N. Sane Trilogy", studio: "Sega", contentRaiting: "E+", publicationYear: "1991", description: "Juego de Sega Genesis publicado en 1991 con más de 40 millones de copias vendidas actualmente", platforms:  ["PC", "Playstation 4"], tags: ["plataformas","mascota"], galleryImages: [ "https://cdn.cloudflare.steamstatic.com/steam/apps/731490/ss_fad459eb04408dd926de3b789c8bc6d13bf855c0.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/731490/ss_931f13ad19753ac5d491bc55e31ec9e2181ca637.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/731490/ss_c2439741a40a81e4772412b4a92866aa1f188f2f.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/731490/ss_1a5bd0956c774afcadb1474f5fed2085715f2987.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/731490/ss_bf301672eede469605ef823057cba1eb3b845f12.600x338.jpg"
                                                                                                                                                                                                                                                                                                                                ])
        .environmentObject(FavoritesManager())
        
    }
}
