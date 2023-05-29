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
                    
                    LoginAndSignUpSwitchView()
                    
                }
            }
            
        }
    }
}

struct LoginAndSignUpSwitchView: View {
    
    @State var loginType = true
    
    var body: some View {
        
        VStack{
            
            HStack {
                
                Button("INICIA SESIÓN") {
                    
                    loginType = true
                    
                }
                .foregroundColor(loginType ? .white : .gray)
                .fontWeight(loginType ? .bold : nil)
                .font(.title2)
                
                
                Spacer()
                
                Button("REGÍSTRATE") {
                    
                    loginType = false
                    
                }
                .foregroundColor(loginType ? .gray : .white)
                .fontWeight(loginType ? nil : .bold)
                .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                

            }
            .padding(.horizontal, 20)
            
            Spacer(minLength: 60)
            
            if loginType {
                
                LoginView()
                
            } else {
                
                SignUpView(loginType: $loginType)
                
            }
        }
    }
}



struct MainView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        MainView()
        
    }
}
