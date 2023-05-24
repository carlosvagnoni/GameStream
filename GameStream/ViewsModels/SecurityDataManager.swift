//
//  SaveData.swift
//  GameStream
//
//  Created by user239477 on 5/21/23.
//

import Foundation
import Security

class KeychainManager {

    @discardableResult
    class func save(key: String, data: Data) -> OSStatus {
        let query = [
            kSecClass as String       : kSecClassGenericPassword as String,
            kSecAttrAccount as String : key,
            kSecValueData as String   : data ] as [String : Any]

        SecItemDelete(query as CFDictionary)

        return SecItemAdd(query as CFDictionary, nil)
    }

    class func load(key: String) -> Data? {
        let query = [
            kSecClass as String       : kSecClassGenericPassword,
            kSecAttrAccount as String : key,
            kSecReturnData as String  : kCFBooleanTrue!,
            kSecMatchLimit as String  : kSecMatchLimitOne ] as [String : Any]

        var dataTypeRef: AnyObject? = nil

        let status: OSStatus = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)

        if status == noErr {
            return dataTypeRef as! Data?
        } else {
            return nil
        }
    }

    class func delete(key: String) -> OSStatus {
        let query = [
            kSecClass as String       : kSecClassGenericPassword,
            kSecAttrAccount as String : key ] as [String : Any]

        return SecItemDelete(query as CFDictionary)
    }
}

class SecurityDataManager {
    static func saveData(email: String, password: String, userName: String) -> Bool {
        guard let emailData = email.data(using: .utf8),
              let passwordData = password.data(using: .utf8),
              let userNameData = userName.data(using: .utf8) else {
            return false
        }

        KeychainManager.save(key: "email", data: emailData)
        KeychainManager.save(key: "password", data: passwordData)
        KeychainManager.save(key: "userName", data: userNameData)
        
        return true
    }

    static func retrieveData() -> [String] {
        guard let userEmailData = KeychainManager.load(key: "email"),
              let userPasswordData = KeychainManager.load(key: "password"),
              let userNameData = KeychainManager.load(key: "userName"),
              let email = String(data: userEmailData, encoding: .utf8),
              let password = String(data: userPasswordData, encoding: .utf8),
              let userName = String(data: userNameData, encoding: .utf8) else {
            return []
        }
        
        return [email, password, userName]
    }

    static func validate(email: String, password: String) -> Bool {
        guard let userEmailData = KeychainManager.load(key: "email"),
              let userPasswordData = KeychainManager.load(key: "password"),
              let savedEmail = String(data: userEmailData, encoding: .utf8),
              let savedPassword = String(data: userPasswordData, encoding: .utf8) else {
            return false
        }
        
        return email == savedEmail && password == savedPassword
    }
}
