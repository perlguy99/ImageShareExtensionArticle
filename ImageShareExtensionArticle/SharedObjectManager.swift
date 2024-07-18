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
        loadSharedObject()
    }
    
    func fetchSharedObjectFromDataStore() -> SharedObject? {
        guard let savedData = defaults.data(forKey: key),
              let savedSharedObject = try? JSONDecoder().decode(SharedObject.self, from: savedData) else {
            return nil
        }
        
        return savedSharedObject
    }
    
    func getCurrentSharedObject() -> SharedObject {
        return currentSharedObject ?? defaultSharedObject
    }
    
    func setCurrentSharedObject(sharedObject: SharedObject) {
        currentSharedObject = sharedObject
        saveSharedObject()
    }
    
    func saveSharedObject() {
        guard let encoded = try? JSONEncoder().encode(currentSharedObject) else { return }
        defaults.set(encoded, forKey: key)
    }
    
    func loadSharedObject() {
        currentSharedObject = fetchSharedObjectFromDataStore() ?? defaultSharedObject
    }
}
