//
//  SharedObjectManager.swift
//  ImageShareExtensionArticle
//
//  Created by Brent Michalski on 7/17/24.
//

import SwiftUI

class SharedObjectManager {
    var currentSharedObject: SharedObject?
    
    init(currentSharedObject: SharedObject? = nil) {
        self.currentSharedObject = currentSharedObject
    }
    
    func getSharedObject() -> SharedObject? {
        
        if currentSharedObject == nil {
            print("\n-------------currentSharedObject == nil-----------------\n")
            
            let defaultSharedObject = SharedObject(image: UIImage(named: "snowflake")!, title: "Default Title X")
            
            currentSharedObject = defaultSharedObject
        }
        
        return currentSharedObject
    }
}
