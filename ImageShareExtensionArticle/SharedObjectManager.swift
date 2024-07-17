//
//  SharedObjectManager.swift
//  ImageShareExtensionArticle
//
//  Created by Brent Michalski on 7/17/24.
//

import SwiftUI

class SharedObjectManager {
    let defaultSharedObject = SharedObject(image: UIImage(systemName: "snowflake") ?? UIImage(), title: "Default Title X")
    
    let key = "testSharedObject"
    let defaults = UserDefaults.standard
    
    var currentSharedObject: SharedObject?
    
    init() {
        if let savedObject = fetchSharedObjectFromDataStore() {
            currentSharedObject = savedObject
        }
    }
    
    func fetchSharedObjectFromDataStore() -> SharedObject? {
        if let savedData = defaults.data(forKey: key) {
            if let savedSharedObject = try? JSONDecoder().decode(SharedObject.self, from: savedData) {
                return savedSharedObject
            }
        }
        return nil
    }
    
    func getCurrentSharedObject() -> SharedObject {
        return fetchSharedObjectFromDataStore() ?? defaultSharedObject
    }
    
    func setCurrentSharedObject(sharedObject: SharedObject) {
        currentSharedObject = sharedObject
        saveSharedObject()
    }
    
    func saveSharedObject() {
        // Save to UserDefaults
        if let encoded = try? JSONEncoder().encode(currentSharedObject) {
            defaults.set(encoded, forKey: key)
        }
    }
    

    
    func loadSharedObject() {
        // Retrieve from UserDefaults
        guard let savedData = defaults.data(forKey: key),
              let savedSharedObject = try? JSONDecoder().decode(
                SharedObject.self, from: savedData
              ) else {
            return
        }

        currentSharedObject = savedSharedObject
    }
}
