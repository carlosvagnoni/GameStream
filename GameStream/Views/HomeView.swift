//
//  HomeView.swift
//  GameStream
//
//  Created by user239477 on 5/11/23.
//

import SwiftUI

struct HomeView: View {
    
    @State var searchText = ""
    
    var body: some View {
        
        ZStack {
            
            Spacer()
            
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
                .background(Color("blue-gray"))
                .clipShape(Capsule())
                .padding(.bottom, 20)
                
                ScrollView(showsIndicators: false) {
                    SubModuleHome()
                }
                
                
            }
            .padding(.horizontal, 20)
            
        }
        
        
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
