//
//  HomeView.swift
//  GameStream
//
//  Created by user239477 on 5/11/23.
//

import SwiftUI

struct HomeView: View {
    
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
            
            Text("Pantalla de Juegos")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    VStack {
                        Image(systemName: "gamecontroller")
                        Text("Juegos")
                    }
                }
                .tag(1)
            
            HomeScreen()
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
            UITabBar.appearance().backgroundColor = UIColor(Color("tabBarColor"))
            UITabBar.appearance().isTranslucent = true
            
        }
        .tint(.white)
        
        
    }
    
//    init() {
//        UITabBar.appearance().backgroundColor = UIColor(Color("tabBarColor"))
//        UITabBar.appearance().isTranslucent = true
//
//    }
}

struct HomeScreen: View {
    
    @State var searchText = ""
    
    var body: some View {
        
        ZStack {
            
            Color("marine")
                .ignoresSafeArea()
            
            VStack {
                
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
                .padding(.bottom, 30)
                
                HStack {
                    
                    Button {
                        searchButton(searchText: $searchText)
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(searchText.isEmpty ? Color(.white) : Color("dark-cian"))
                    }
                    
                    TextField(text: $searchText) {
                        Text("Buscar video")
                            .foregroundColor(.gray)
                    }
                    .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)

                }
                .padding([.top, .leading, .bottom], 11.0)
                .background(Color("tabBarColor"))
                .clipShape(Capsule())
            }
            .padding(.horizontal, 20)
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

func searchButton(searchText: Binding<String>) {
    print("Buscando \(searchText.wrappedValue)")
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
