//
//  EditprofileViewModel.swift
//  GameStream
//
//  Created by user239477 on 5/28/23.
//

import Foundation

class EditProfileViewModel: ObservableObject {
    
    @Published var successfulUpdateDataView = false
    @Published var activeAlert: EditProfileAlert?    
    @Published var email = ""
    @Published var password = ""
    @Published var userName = ""
    
    func updateData(email: String, password: String, userName: String, selectedPhotoData: Data?, profilePhotoManager: ProfilePhotoManager) {
        
        guard ValidationService.isValidEmail(email) else {
            
            activeAlert = .incorrectEmailFormat
            return
        }
        
        guard ValidationService.isValidPassword(password) else {
            
            activeAlert = .incorrectPasswordFormat
            return
        }
        
        guard !SecurityDataManager.validate(email: email, password: password) else {
            
            activeAlert = .credentialsSameAsCurrent
            return
        }
        
        guard !userName.isEmpty else {
            
            activeAlert = .emptyUserName
            return
        }
        
        
        
        if let data = selectedPhotoData {
            
                profilePhotoManager.saveProfilePhoto(data)
            
            } else {
                
                profilePhotoManager.deleteProfilePhoto()
                
            }
        
        SecurityDataManager.saveData(email: email, password: password, userName: userName)
        
        successfulUpdateDataView = true
        
    }
}
