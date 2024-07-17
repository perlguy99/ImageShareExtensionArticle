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
    
    init(currentSharedObject: SharedObject? = nil) {
        self.currentSharedObject = currentSharedObject
    }
    
    func getCurrentSharedObject() -> SharedObject {
        return currentSharedObject ?? defaultSharedObject
    }
    
    func setCurrentSharedObject(sharedObject: SharedObject) {
        currentSharedObject = sharedObject
    }
    
    func saveSharedObject() {
        // Save to UserDefaults
        if let encoded = try? JSONEncoder().encode(currentSharedObject)
        {
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
