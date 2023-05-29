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
            
            ProfileView()
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
            
            FavoritesView()
                .tabItem {
                    
                    VStack {
                        
                        Image(systemName: "heart")
                        
                        Text("Favoritos")
                        
                    }
                    .padding(.top, 20)
                }
                .tag(3)
            
        }
        .tint(.white)
        .navigationBarBackButtonHidden()
        
        
        
    }
    
    init() {
        
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color.gray.opacity(0.5))
        
        let tabBarBackgroundImage = createImage(color: UIColor(Color("blue-gray")), size: CGSize(width: 1, height: 1))
        
        UITabBar.appearance().backgroundImage = tabBarBackgroundImage
        UITabBar.appearance().isTranslucent = true
        
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        
        tabBarAppearance.backgroundColor = UIColor(Color("blue-gray"))
        
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        
    }

    func createImage(color: UIColor, size: CGSize) -> UIImage {
        
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
 
}

struct HomeTabView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        HomeTabView()
            .environmentObject(FavoritesManager())
            .environmentObject(ProfilePhotoManager())
        
    }
}
