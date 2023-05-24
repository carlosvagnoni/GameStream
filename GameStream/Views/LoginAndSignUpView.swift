//
//  LoginAndSignUpView.swift
//  GameStream
//
//  Created by user239477 on 5/13/23.
//

import SwiftUI

struct LoginAndSignUpView: View {
    
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

struct LoginAndSignUpView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ZStack {
            
            Spacer()
            
            Color("marine")
                .ignoresSafeArea()
            
            LoginAndSignUpView()
            
        }
    }
}
