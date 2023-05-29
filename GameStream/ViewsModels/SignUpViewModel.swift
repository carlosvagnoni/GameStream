//
//  SignUpViewModel.swift
//  GameStream
//
//  Created by user239477 on 5/28/23.
//

import Foundation

class SignUpViewModel: ObservableObject {
    
    @Published var successfulSignUpView = false
    @Published var activeAlert: SignUpAlert?
    
    func signUp(email: String, password: String, confirmedPassword: String, selectedPhotoData: Data?, profilePhotoManager: ProfilePhotoManager) {
        
        guard ValidationService.isValidEmail(email) else {
            
            activeAlert = .incorrectEmailFormat
            return
        }
        
        guard ValidationService.isValidPassword(password) else {
            
            activeAlert = .incorrectPasswordFormat
            return
        }
        
        guard password == confirmedPassword else {
            
            activeAlert = .passwordsDoNotMatch
            return
        }
        
        if let data = selectedPhotoData {
            
            profilePhotoManager.saveProfilePhoto(data)
            
        } else {
            
            profilePhotoManager.deleteProfilePhoto()
            
        }
        
        SecurityDataManager.saveData(email: email, password: password, userName: email)
        
        successfulSignUpView = true
        
    }
    
    func facebookSignUp() {
        
        print("Registrando usuario con facebook")
        
    }

    func twitterSignUp() {
        
        print("Registrando usuario con twitter")
        
    }
    
}
