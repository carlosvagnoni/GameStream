//
//  HomeView.swift
//  GameStream
//
//  Created by user239477 on 5/11/23.
//

import SwiftUI

struct HomeView: View {
    
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
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 35, trailing: 0))
                
                
                VStack {
                    
                    ScrollView(showsIndicators: false) {
                        
                        SubModuleHome()
                        
                    }
                    
                    
                }
                .padding(.horizontal, 20)
                
                
                
            }
            
            
        }
        
    }
}

struct SubModuleHome: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @ObservedObject var allGames = GamesViewModel()
    @ObservedObject var homeViewModel = HomeViewModel()
    
    @State var searchText = ""
    @State var url: String = ""
    @State var title: String = ""
    @State var studio: String = ""
    @State var contentRaiting: String = ""
    @State var publicationYear: String = ""
    @State var description: String = ""
    @State var platforms: [String] = [""]
    @State var tags: [String] = [""]
    @State var galleryImages: [String] = [""]
    
    var body: some View {
        
        
        VStack(spacing: 0) {
            
            HStack {
                
                Button {
                    
                    if searchText.isEmpty {
                        
                        homeViewModel.activeAlert = .searchTextEmpty
                        
                    } else {
                        
                        homeViewModel.watchGame(name: searchText, url: $url, title: $title, studio: $studio, contentRaiting: $contentRaiting, publicationYear: $publicationYear, description: $description, platforms: $platforms, tags: $tags, galleryImages: $galleryImages)
                        
                    }
                    
                    
                } label: {
                    
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(searchText.isEmpty ? Color(.white) : Color("dark-cian"))
                    
                }
                .alert(item: $homeViewModel.activeAlert) { alertType in
                    switch alertType {
                        
                    case .gameNotFound:
                        return Alert(title: Text("Error"), message: Text("No se encontró el juego"), dismissButton: .default(Text("Entendido")))
                        
                    case .searchTextEmpty:
                        return Alert(title: Text("Error"), message: Text("El campo de búsqueda no puede estar vacío"), dismissButton: .default(Text("Entendido")))
                    }
                }
                
                TextField(text: $searchText) {
                    Text("Buscar juego")
                        .foregroundColor(.gray)
                }
                .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled(true)


            }
            .padding([.top, .leading, .bottom], 11.0)
            .background(Color("blue-gray"))
            .clipShape(Capsule())

            ZStack {
                
                VStack(spacing: 0) {
                    
                    Text("LOS MÁS POPULARES")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(EdgeInsets(top: 35, leading: 0, bottom: 15, trailing: 0))
                    
                    
                    Button {
                        
                        homeViewModel.watchGame(name: "The Witcher 3", url: $url, title: $title, studio: $studio, contentRaiting: $contentRaiting, publicationYear: $publicationYear, description: $description, platforms: $platforms, tags: $tags, galleryImages: $galleryImages)
                        
                    } label: {
                        
                        ZStack {
                            
                            VStack(spacing: 0) {
                                
                                Image("The Witcher 3")
                                    .resizable()
                                    .scaledToFill()
                                
                                Text("The Witcher 3: Wild Hunt")
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                    .frame(height: 40)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                    .font(.headline)
                                    .padding(.leading, 10)
                                    .background(Color("blue-gray"))
                                
                            }
                            
                            Image(systemName: "play.circle.fill")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 50, height: 50)
                            
                            
                        }
                        
                    }
                    .padding(.bottom, 30)
                    
                    Text("CATEGORÍAS SUGERIDAS PARA TI")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 15)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        HStack {
                            
                            
                            Button {
                                
                                print("Categoria 1")
                                
                            } label: {
                                
                                ZStack {
                                    
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(Color("blue-gray"))
                                        .frame(width: 110, height: 85)
                                    
                                    VStack {
                                        
                                        Image("appLogoController")
                                            . resizable()
                                            .scaledToFit()
                                            .frame(width: 20, height: 20)
                                        
                                        Text("CATEGORY")
                                            .font(.footnote)
                                            .fontWeight(.bold)
                                            .foregroundColor(Color("dark-cian"))
                                    }
                                }
                                
                            }
                            
                            Button {
                                
                                print("Categoria 2")
                                
                            } label: {
                                
                                ZStack {
                                    
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(Color("blue-gray"))
                                        .frame(width: 110, height: 85)
                                    
                                    VStack {
                                        
                                        Image("fps")
                                            . resizable()
                                            .scaledToFit()
                                            .frame(width: 20, height: 20)
                                        
                                        Text("FPS")
                                            .font(.footnote)
                                            .fontWeight(.bold)
                                            .foregroundColor(Color("dark-cian"))
                                    }
                                }
                                
                            }
                            
                            Button {
                                
                                print("Categoria 3")
                                
                            } label: {
                                
                                ZStack {
                                    
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(Color("blue-gray"))
                                        .frame(width: 110, height: 85)
                                    
                                    VStack {
                                        
                                        Image("rpg-icon")
                                            . resizable()
                                            .scaledToFit()
                                            .frame(width: 20, height: 20)
                                        
                                        Text("RPG")
                                            .font(.footnote)
                                            .fontWeight(.bold)
                                            .foregroundColor(Color("dark-cian"))
                                    }
                                }
                                
                            }
                            
                            Button {
                                
                                print("Categoria 4")
                                
                            } label: {
                                
                                ZStack {
                                    
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(Color("blue-gray"))
                                        .frame(width: 110, height: 85)
                                    
                                    VStack {
                                        
                                        Image("open-world-icon")
                                            . resizable()
                                            .scaledToFit()
                                            .frame(width: 20, height: 20)
                                        
                                        Text("OPEN WORLD")
                                            .font(.footnote)
                                            .fontWeight(.bold)
                                            .foregroundColor(Color("dark-cian"))
                                    }
                                }
                                
                            }
                            
                            
                            
                            
                        }
                        
                    }
                    .padding(.bottom, 30)
                    
                    Text("RECOMENDADO PARA TI")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 15)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        HStack {
                            
                            Button {
                                
                                homeViewModel.watchGame(name: "Abzu", url: $url, title: $title, studio: $studio, contentRaiting: $contentRaiting, publicationYear: $publicationYear, description: $description, platforms: $platforms, tags: $tags, galleryImages: $galleryImages)
                                
                            } label: {
                                
                                Image("Abzu")
                                    .resizable()
                                    .frame(width: 240, height: 135)
                                    .cornerRadius(8)
                                
                            }
                            
                            Button {
                                
                                homeViewModel.watchGame(name: "Crash Bandicoot", url: $url, title: $title, studio: $studio, contentRaiting: $contentRaiting, publicationYear: $publicationYear, description: $description, platforms: $platforms, tags: $tags, galleryImages: $galleryImages)
                                
                            } label: {
                                
                                Image("Crash Bandicoot")
                                    .resizable()
                                    .frame(width: 240, height: 135)
                                    .cornerRadius(8)
                                
                            }
                            
                            Button {
                                
                                homeViewModel.watchGame(name: "DEATH STRANDING", url: $url, title: $title, studio: $studio, contentRaiting: $contentRaiting, publicationYear: $publicationYear, description: $description, platforms: $platforms, tags: $tags, galleryImages: $galleryImages)
                                
                            } label: {
                                
                                Image("DEATH STRANDING")
                                    .resizable()
                                    .frame(width: 240, height: 135)
                                    .cornerRadius(8)
                                
                            }
                            
                            Button {
                                
                                homeViewModel.watchGame(name: "Cuphead", url: $url, title: $title, studio: $studio, contentRaiting: $contentRaiting, publicationYear: $publicationYear, description: $description, platforms: $platforms, tags: $tags, galleryImages: $galleryImages)
                                
                            } label: {
                                
                                Image("Cuphead")
                                    .resizable()
                                    .frame(width: 240, height: 135)
                                    .cornerRadius(8)
                                
                            }
                            
                            Button {
                                
                                homeViewModel.watchGame(name: "Hades", url: $url, title: $title, studio: $studio, contentRaiting: $contentRaiting, publicationYear: $publicationYear, description: $description, platforms: $platforms, tags: $tags, galleryImages: $galleryImages)
                                
                            } label: {
                                
                                Image("Hades")
                                    .resizable()
                                    .frame(width: 240, height: 135)
                                    .cornerRadius(8)
                                
                            }
                            
                            Button {
                                
                                homeViewModel.watchGame(name: "Grand Theft Auto V", url: $url, title: $title, studio: $studio, contentRaiting: $contentRaiting, publicationYear: $publicationYear, description: $description, platforms: $platforms, tags: $tags, galleryImages: $galleryImages)
                                
                            } label: {
                                
                                Image("Grand Theft Auto V")
                                    .resizable()
                                    .frame(width: 240, height: 135)
                                    .cornerRadius(8)
                                
                            }
                            
                            
                        }
                        
                    }
                    .padding(.bottom, 30)
                    
                    Text("JUEGOS QUE PODRÍAN GUSTARTE")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 15)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        HStack {
                            
                            Button {
                                
                                print("Ir a juego 1")
                                
                            } label: {
                                
                                Image("tlouii")
                                    .resizable()
                                    .frame(width: 240, height: 135)
                                    .cornerRadius(8)
                                
                            }
                            
                            Button {
                                
                                print("Ir a juego 2")
                                
                            } label: {
                                
                                Image("destiny")
                                    .resizable()
                                    .frame(width: 240, height: 135)
                                    .cornerRadius(8)
                                
                            }
                            
                            Button {
                                
                                print("Ir a juego 3")
                                
                            } label: {
                                
                                Image("spiderman")
                                    .resizable()
                                    .frame(width: 240, height: 135)
                                    .cornerRadius(8)
                                
                            }
                            
                            Button {
                                
                                print("Ir a juego 4")
                                
                            } label: {
                                
                                Image("titanfall2")
                                    .resizable()
                                    .frame(width: 240, height: 135)
                                    .cornerRadius(8)
                                
                            }
                            
                            Button {
                                
                                print("Ir a juego 5")
                                
                            } label: {
                                
                                Image("uncharted4")
                                    .resizable()
                                    .frame(width: 240, height: 135)
                                    .cornerRadius(8)
                                
                            }
                            
                            Button {
                                
                                print("Ir a juego 6")
                                
                            } label: {
                                
                                Image("assassinscreed")
                                    .resizable()
                                    .frame(width: 240, height: 135)
                                    .cornerRadius(8)
                                
                            }
                            
                            Button {
                                
                                print("Ir a juego 7")
                                
                            } label: {
                                
                                Image("farcry4")
                                    .resizable()
                                    .frame(width: 240, height: 135)
                                    .cornerRadius(8)
                                
                            }
                            
                            Button {
                                
                                print("Ir a juego 8")
                                
                            } label: {
                                
                                Image("battlefield6")
                                    .resizable()
                                    .frame(width: 240, height: 135)
                                    .cornerRadius(8)
                                
                            }
                            
                            
                        }
                        
                    }
                    .padding(.bottom, 30)
                    
                }
                
                if !searchText.isEmpty {
                    
                    VStack(spacing: 0) {
                        
                        VStack(spacing: 0) {
                            
                            ForEach(allGames.gamesInfo.filter({ game in
                                game.title.lowercased().starts(with: searchText.lowercased())
                                
                            }), id: \.self) { game in
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
                                    
                                    homeViewModel.isGameViewActive = true
                                    
                                } label: {
                                    
                                    VStack(spacing: 0) {
                                        
                                        HStack(spacing: 0) {
                                            
                                            Text("\(game.title)")
                                                .padding(.leading, 20)
                                                .font(.subheadline)
                                                .foregroundColor(.white)
                                            
                                            Spacer()
                                            
                                            Image(systemName: "magnifyingglass")
                                                .foregroundColor(Color("dark-cian"))
                                                .padding(.trailing, 20)
                                            
                                        }
                                        .frame(height: 40)
                                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                        .background(Color("blue-gray").opacity(1.8))
                                        
                                            
                                        
                                    }
                                }
                            }
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .padding(.top, 5)
                        
                        Spacer()
                    }
                    
                    
                }
                
            }
            
            
            
            
        }
        
        
        NavigationLink(destination: GameView(url: url, title: title, studio: studio, contentRaiting: contentRaiting, publicationYear: publicationYear, description: description, platforms: platforms, tags: tags, galleryImages: galleryImages), isActive: $homeViewModel.isGameViewActive) {
            
            EmptyView()
        }
        
    }
    
    
}

struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        HomeView()
    }
}
