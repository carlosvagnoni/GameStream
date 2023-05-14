//
//  HomeTabView.swift
//  GameStream
//
//  Created by user239477 on 5/13/23.
//

import SwiftUI

struct HomeTabView: View {
    
    @State var tabSeleccionado: Int = 2
    
    var body: some View {
        
        TabView(selection: $tabSeleccionado) {
            
            Text("Perfil")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    
                    VStack {
                        
                        Image(systemName: "person")
                        
                        Text("Perfil")
                        
                    }
                }
                .tag(0)
            
            GamesView()
                .tabItem {
                    
                    VStack {
                        
                        Image(systemName: "gamecontroller")
                        
                        Text("Juegos")
                        
                    }
                }
                .tag(1)
            
            HomeView()
                .tabItem {
                    
                    VStack {
                        
                        Image(systemName: "house")
                        
                        Text("Inicio")
                        
                    }
                }
                .tag(2)
            
            Text("Favoritos")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    
                    VStack {
                        
                        Image(systemName: "heart")
                        
                        Text("Favoritos")
                        
                    }
                    .padding(.top, 20)
                }
                .tag(3)
            
        }
        .onAppear() {
            
            UITabBar.appearance().unselectedItemTintColor = UIColor(Color.gray.opacity(0.5))
            
            UITabBar.appearance().backgroundColor = UIColor(Color("blue-gray"))
            
        }
        .tint(.white)
        .navigationBarBackButtonHidden()
        
        
    }
}

struct HomeTabView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        HomeTabView()
        
    }
}
