//
//  MainView.swift
//  GameStream
//
//  Created by user239477 on 5/27/23.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        
        NavigationStack {
            
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
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 60, trailing: 0))
                    
                    LoginAndSignUpView()
                    
                }
            }
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        MainView()
        
    }
}
