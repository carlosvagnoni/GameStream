//
//  SubModuleHome.swift
//  GameStream
//
//  Created by user239477 on 5/13/23.
//

import SwiftUI
import AVKit

struct SubModuleHome: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
    
    @State var isPlayerActive = false
    
    let urlVideos:[String] = ["https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"]
    
    var body: some View {
        
        
        VStack {
            
            Text("LOS MÁS POPULARES")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 10)
            
            
            Button {
                
                url = urlVideos[0]
                
                isPlayerActive = true
                
            } label: {
                
                ZStack {
                    
                    VStack(spacing: 0) {
                        
                        Image("The Witcher 3")
                            .resizable()
                            .scaledToFill()
                        
                        Text("The Witcher 3: Wild Hunt")
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
            .padding(.bottom, 20)
            
            Text("CATEGORÍAS SUGERIDAS PARA TI")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 10)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack {
                    
                    
                    Button {
                        
                        print("Categoria 1")
                        
                    } label: {
                        
                        ZStack {
                            
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("blue-gray"))
                                .frame(width: 200, height: 130)
                            
                            VStack {
                                
                                Image("appLogoController")
                                    . resizable()
                                    .scaledToFit()
                                    .frame(width: 42, height: 42)
                                
                                Text("CATEGORY")
                                    .font(.title3)
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
                                .frame(width: 200, height: 130)
                            
                            VStack {
                                
                                Image("fps")
                                    . resizable()
                                    .scaledToFit()
                                    .frame(width: 42, height: 42)
                                
                                Text("FPS")
                                    .font(.title3)
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
                                .frame(width: 200, height: 130)
                            
                            VStack {
                                
                                Image("rpg-icon")
                                    . resizable()
                                    .scaledToFit()
                                    .frame(width: 42, height: 42)
                                
                                Text("RPG")
                                    .font(.title3)
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
                                .frame(width: 200, height: 130)
                            
                            VStack {
                                
                                Image("open-world-icon")
                                    . resizable()
                                    .scaledToFit()
                                    .frame(width: 42, height: 42)
                                
                                Text("OPEN WORLD")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("dark-cian"))
                            }
                        }
                        
                    }
                    
                    
                    
                    
                }
                
            }
            .padding(.bottom, 20)
            
            Text("RECOMENDADO PARA TI")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 10)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack {
                    
                    Button {
                        
                        url = urlVideos[1]
                        
                        isPlayerActive = true
                        
                    } label: {
                        
                        Image("Abzu")
                            .resizable()
                            .frame(width: 240, height: 135)
                            .cornerRadius(8)
                        
                    }
                    
                    Button {
                        
                        url = urlVideos[2]
                        
                        isPlayerActive = true
                        
                    } label: {
                        
                        Image("Crash Bandicoot")
                            .resizable()
                            .frame(width: 240, height: 135)
                            .cornerRadius(8)
                        
                    }
                    
                    Button {
                        
                        url = urlVideos[3]
                        
                        isPlayerActive = true
                        
                    } label: {
                        
                        Image("DEATH STRANDING")
                            .resizable()
                            .frame(width: 240, height: 135)
                            .cornerRadius(8)
                        
                    }
                    
                    Button {
                        
                        url = urlVideos[4]
                        
                        isPlayerActive = true
                        
                    } label: {
                        
                        Image("Cuphead")
                            .resizable()
                            .frame(width: 240, height: 135)
                            .cornerRadius(8)
                        
                    }
                    
                    Button {
                        
                        url = urlVideos[5]
                        
                        isPlayerActive = true
                        
                    } label: {
                        
                        Image("Hades")
                            .resizable()
                            .frame(width: 240, height: 135)
                            .cornerRadius(8)
                        
                    }
                    
                    Button {
                        
                        url = urlVideos[6]
                        
                        isPlayerActive = true
                        
                    } label: {
                        
                        Image("Grand Theft Auto V")
                            .resizable()
                            .frame(width: 240, height: 135)
                            .cornerRadius(8)
                        
                    }
                    
                    
                }
                
            }
            .padding(.bottom, 20)
            
            Text("JUEGOS QUE PODRÍAN GUSTARTE")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 10)
            
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
            .padding(.bottom, 20)
            
            
        }
        
        NavigationLink(
            destination: Videos(url: url),
            isActive: $isPlayerActive,
            label: {
                EmptyView()
            })
    }
}

struct Videos: View {
    
    @Environment(\.dismiss) private var dismiss
    
    let url: String
    
    var body: some View {
        
        ZStack {
            
            Color("marine")
            
            VideoPlayer(player:
                            AVPlayer(url:  URL(string: url)!))
            .frame(width: 400, height: 300)
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                
                Button {
                    
                    dismiss()
                    
                } label: {
                    
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                
                
            }
        }
    }
}

struct SubModuleHome_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ZStack {
            
            Spacer()
            
            Color("marine")
                .ignoresSafeArea()
            
            SubModuleHome()
            
        }
    }
}
