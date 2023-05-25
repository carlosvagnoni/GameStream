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

struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        HomeView()
    }
}
