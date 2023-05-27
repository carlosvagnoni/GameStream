//
//  PrfoilePhotoManager.swift
//  GameStream
//
//  Created by user239477 on 5/26/23.
//

import Foundation

class ProfilePhotoManager: ObservableObject {
    @Published var photoData: Data? = UserDefaults.standard.data(forKey: "savedProfilePhotoData")

    func saveProfilePhoto(_ data: Data) {
        UserDefaults.standard.set(data, forKey: "savedProfilePhotoData")
        photoData = data
    }

    func deleteProfilePhoto() {
        UserDefaults.standard.removeObject(forKey: "savedProfilePhotoData")
        photoData = nil
    }
}
