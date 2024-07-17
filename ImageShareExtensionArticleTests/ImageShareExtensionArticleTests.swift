//
//  ImageShareExtensionArticleTests.swift
//  ImageShareExtensionArticleTests
//
//  Created by Brent Michalski on 7/10/24.
//

import XCTest
import SwiftUI
@testable import ImageShareExtensionArticle

final class ImageShareExtensionArticleTests: XCTestCase {
    // Our key for userDefaults
    let key = "testSharedObject"
    let defaults = UserDefaults.standard
    
    override func setUpWithError() throws {
        defaults.removeObject(forKey: key)
    }
    

    func testCreateSharedObject() throws {
        let testImage = UIImage(systemName: "gear")!
        XCTAssertNoThrow(SharedObject(image: testImage, title: "" ))
    }
    
    func testSaveAndRetrieveSharedObject() {
        // Create a SharedObject instance
        let testImage = UIImage(systemName: "star.fill")!
        let testTitle = "Test Image"
        let testSharedObject = SharedObject(image: testImage, title: testTitle)
        
        // Save to UserDefaults
        if let encoded = try? JSONEncoder().encode(testSharedObject) {
            defaults.set(encoded, forKey: key)
        }
        
        // Retrieve from UserDefaults
        guard let savedData = defaults.data(forKey: key),
              let savedSharedObject = try? JSONDecoder().decode(SharedObject.self, from: savedData) else {
            XCTFail("Failed to retrieve SharedObject from UserDefaults")
            return
        }
        
        // Assert that the retrieved SharedObject matches the original
        XCTAssertEqual(testSharedObject.title, savedSharedObject.title, "Titles do not match")
        XCTAssertEqual(testSharedObject.image.pngData()?.count, savedSharedObject.image.pngData()?.count, "Images do no match")
    }
    
    func testGetSavedObjectOrDefaultObject_expectDefault_v1() {
        // Retrieve from UserDefaults
        if let _ = defaults.data(forKey: key) {
            // We found some data
            XCTFail("Should not have found data")
        } else {
            XCTAssertTrue(true, "If we get here, that would be a default")
        }
    }

    func testGetSavedObjectOrDefaultObject_expectDefault_v2() {
        // Retrieve from UserDefaults
        if let sut = defaults.data(forKey: key) {
            // We found some data
            XCTFail("Should not have found data")
        } else {
            XCTAssertTrue(true, "If we get here, that would be a default")

            // Now, I need to ensure the data we got is the right kind
            let defaultImage = UIImage(named: "snowflake") ?? UIImage()
            let defaultTitle = "Default Title"
            let defaultSharedObject = SharedObject(image: defaultImage, title: defaultTitle)
            
            
        }
    }

    func testGetSavedObjectOrDefaultObject_expectSaved() {
        // Create a SharedObject instance
        let originalSharedObject = SharedObject(image: UIImage(systemName: "star.fill")!, title: "Test Image")
        
        // Save to UserDefaults
        if let encoded = try? JSONEncoder().encode(originalSharedObject) {
            defaults.set(encoded, forKey: key)
        }

        // Retrieve from UserDefaults
        if let _ = defaults.data(forKey: key) {
            // We found some data
            XCTAssertTrue(true, "Found Data")
        } else {
            XCTFail("Should not have gottem the default")
        }
    }

}


//            // We didn't find any data for that key
//            let originalImage = UIImage(systemName: "flag.checkered")!
//            let originalTitle = "Checkered Flag Default"
//            let originalSharedObject = SharedObject(image: originalImage, title: originalTitle)



//        guard let savedData = defaults.data(forKey: key),
//              let retrievedSharedObject = try? JSONDecoder().decode(SharedObject.self, from: savedData) else {
//            XCTFail("Failed to retrieve SharedObject from UserDefaults")
//            return
//        }

        
        
//        let myCustomSharedImage: SharedObject = defaults.data(forKey: key)
