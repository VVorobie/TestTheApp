//
//  Persistance.swift
//  TestTheApp
//
//  Created by Владимир Воробьев on 20.02.2023.
//

import Foundation

final class Persistance {
    static let shared = Persistance()
    
    enum UserProperty: String {
        case id = "id"
        case email = "email"
        case name  = "name"
        case photoName = "photoName"
    }
    
    func createNewUser (_ email: String) {
        addUserProperty(userEmail: email, .id, email)
        addUserProperty(userEmail: email, .email, email)
        deleteUserProperty(userEmail: email, .name)
        deleteUserProperty(userEmail: email, .photoName)
    }
    
    func getCurrentUser (userEmail email: String) -> Bool {
        if getUserProperty(userEmail: email, .email) == email {
            CurrentUser.email = email
            CurrentUser.name = getUserProperty(userEmail: email, .name)
            CurrentUser.photo = getUserProperty(userEmail: email, .photoName)
            CurrentUser.id = getUserProperty(userEmail: email, .id)
            return true
        }
        return false
    }
    
    func saveCurrentUser () {
        guard let email = CurrentUser.email else { return }
            addUserProperty(userEmail: email, .email, email)
        if let id = CurrentUser.id {
            addUserProperty(userEmail: email, .id, String(id))
        }
        if let name  = CurrentUser.name {
            addUserProperty(userEmail: email, .name, name)
        }
        if let photo = CurrentUser.photo {
            addUserProperty(userEmail: email, .photoName, photo)
        }
    }
    
    /// Mark - вспомагательные функции
    private func keyGenerate (_ email: String, _ property: UserProperty) -> String {
        return email + "_" + property.rawValue
    }
    
    private func addUserProperty(userEmail email: String, _ property: UserProperty, _ newValue: String) {
        let key = keyGenerate(email, property)
        UserDefaults.standard.set(newValue, forKey: key)
    }
    
    private func getUserProperty (userEmail email: String, _ property: UserProperty) -> String? {
        let key = keyGenerate(email, property)
        if let text = UserDefaults.standard.string(forKey: key) {
            return text
        }else { return nil }
    }
    
    private func deleteUserProperty (userEmail email: String, _ property: UserProperty) {
        let key = keyGenerate(email, property)
        if UserDefaults.standard.string(forKey: key) != nil {
            UserDefaults.standard.removeObject(forKey: key)
        }
    }
}
