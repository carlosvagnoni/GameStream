//
//  LoginViewModel.swift
//  GameStream
//
//  Created by user239477 on 5/28/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var isHomeViewActive: Bool = false
    @Published var activeAlert: LoginAlert?
    
    func login(email: String, password: String) {
        
        if SecurityDataManager.validate(email: email, password: password) {
            
            isHomeViewActive = true
            
        } else {
            
            activeAlert = .incorrectCredentials
            
        }
    }
    
    func facebookLogin() {
        
        print("Iniciando sesión con Facebook")
        
    }
    
    func twitterLogin() {
        
        print("Iniciando sesión con Twitter")
        
    }
}
