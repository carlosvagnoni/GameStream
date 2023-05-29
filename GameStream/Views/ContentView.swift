//
//  ContentView.swift
//  GameStream
//
//  Created by user239477 on 5/9/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var isActive: Bool = false
    
    var body: some View {
        
        VStack {
                    if self.isActive {
                        
                        MainView()
                        
                    } else {
                        
                        SplashScreenView()
                        
                    }
                }
                .onAppear {

                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        withAnimation {

                            self.isActive = true

                        }
                    }
                }
        
    }
}

struct SplashScreenView: View {
    
    var body: some View {
        
        ZStack {
            
            Color("marine")
                .ignoresSafeArea()
            
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
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ContentView()
        
    }
}
