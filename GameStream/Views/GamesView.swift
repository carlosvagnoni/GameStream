//
//  GamesView.swift
//  GameStream
//
//  Created by user239477 on 5/12/23.
//

import SwiftUI

struct GamesView: View {
    
    @ObservedObject var allGames = ViewModel()
    
    @State var gameViewIsActive: Bool = false
    
    @State var url: String = ""
    
    @State var title: String = ""
    
    @State var studio: String = ""
    
    @State var contentRaiting: String = ""
    
    @State var publicationYear: String = ""
    
    @State var description: String = ""
    
    @State var platforms: [String] = [""]
    
    @State var tags: [String] = [""]
    
    @State var galleryImages: [String] = [""]
    
    let gridForm = [
        
        GridItem(.flexible(), spacing: 8),
        GridItem(.flexible())
        
    ]
    
    var body: some View {
        
        ZStack {
            
            Color("marine")
                .ignoresSafeArea()
            
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
                
                Text("Juegos")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.bottom, 30)
                
                ScrollView {
                    
                    LazyVGrid(columns: gridForm, spacing: 18) {
                        
                        ForEach(allGames.gamesInfo, id: \.self) {
                            
                            game in
                            
                            Button {
                                
                                url = game.videosUrls.mobile
                                title = game.title
                                studio = game.studio
                                contentRaiting = game.contentRaiting
                                publicationYear = game.publicationYear
                                description = game.description
                                platforms = game.platforms
                                tags = game.tags
                                galleryImages = game.galleryImages
                                
                                gameViewIsActive = true
                                                                
                            } label: {
                                
                                VStack(spacing: 0) {
                                    AsyncImage( url: URL( string: game.galleryImages[0])!)
                                    { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)

                                    } placeholder: {
                                        
                                        ProgressView()

                                        }
                                    
                                    Text("\(game.title)".truncate(21))
                                        .font(.subheadline)
                                        .frame(height: 32)
                                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                        .background(Color("blue-gray"))
                                        

                                }
                                
                                
                                
                            }

                            
                        }
                        
                    }
                    
                }
                
            }
            .padding(.horizontal, 20)
            
            NavigationLink(destination: GameView(url: url, title: title, studio: studio, contentRaiting: contentRaiting, publicationYear: publicationYear, description: description, platforms: platforms, tags: tags, galleryImages: galleryImages), isActive: $gameViewIsActive) {
                EmptyView()
            }
            
        }
        
    }
}

extension String {
    func truncate(_ length: Int) -> String {
        guard self.count > length else { return self }
        return prefix(length) + "..."
    }
}


struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
    }
}
