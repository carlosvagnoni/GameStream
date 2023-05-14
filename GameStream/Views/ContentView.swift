//
//  ContentView.swift
//  GameStream
//
//  Created by user239477 on 5/9/23.
//

import SwiftUI

struct ContentView: View {
    
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
                    .padding(.bottom, 60)
                    
                    LoginAndSignUpView()
                    
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ContentView()
        
    }
}
