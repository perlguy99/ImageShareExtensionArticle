//
//  SharedObjectManager.swift
//  ImageShareExtensionArticle
//
//  Created by Brent Michalski on 7/17/24.
//

import SwiftUI

class SharedObjectManager {
    let key = "testSharedObject"
    let defaults = UserDefaults.standard
    var currentSharedObject: SharedObject?
    
    init(currentSharedObject: SharedObject? = nil) {
        self.currentSharedObject = currentSharedObject
    }
    
    func getSharedObject() -> SharedObject? {
        if currentSharedObject == nil {
            let defaultSharedObject = SharedObject(image: UIImage(systemName: "snowflake")!, title: "Default Title X")
            
            currentSharedObject = defaultSharedObject
        }
        
        return currentSharedObject
    }
    
    func saveObject() {
        // Save to UserDefaults
        if let encoded = try? JSONEncoder().encode(currentSharedObject)
        {
            defaults.set(encoded, forKey: key)
        }
    }
    
    func loadSavedObject() {
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
