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
    
    func testGetSavedObjectOrDefaultObject_expectDefault() {
        // Retrieve from UserDefaults
        if let _ = defaults.data(forKey: key) {
            // We found some data
            XCTFail("Should not have found data")
        } else {
            XCTAssertTrue(true, "If we get here, that would be a default")
        }
    }

    func testGetSavedObjectOrDefaultObject_expectSaved() {
        // Create a SharedObject instance
        let testSharedObject = SharedObject(image: UIImage(systemName: "star.fill")!, title: "Test Image")
        
        // Save to UserDefaults
        if let encoded = try? JSONEncoder().encode(testSharedObject) {
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
    
    func testCreateSharedObjectManager() {
        XCTAssertNoThrow(SharedObjectManager())
    }
    
    func testGetSharedObjectFromSharedObjectManager() {
        let sut = SharedObjectManager()
        XCTAssertNotNil(sut.getCurrentSharedObject())
    }

    func isUserDefaultsEmpty() {
        
        
    }
    
    func testSharedObjectManagerCanSaveAndRetrieveData() {
        let defaultSharedObject = SharedObject(image: UIImage(named: "f35")!, title: "Default Title Xf35")
        let sut = SharedObjectManager(currentSharedObject: defaultSharedObject)
        
        // Verify no data yet
        XCTAssertNil(defaults.data(forKey: key))
        
        // Verify that sut contains a SharedObject
        XCTAssertNotNil(sut.getCurrentSharedObject())
        
        // Save the object
        sut.saveSharedObject()
        
        // Verify we have data
        XCTAssertNotNil(defaults.data(forKey: key))
        
        // Clear the currentSharedObject from the sut
        sut.currentSharedObject = nil
        
        XCTAssertNil(sut.currentSharedObject)
        
        // Load the object
        sut.loadSharedObject()
        
        guard let loadedObject = sut.currentSharedObject else {
            XCTFail("No loadedObject found")
            return
        }
        
        // Verify we get the correct data...
        XCTAssertEqual(loadedObject.title, defaultSharedObject.title)
        XCTAssertEqual(loadedObject.image.pngData()?.count, defaultSharedObject.image.pngData()?.count, "Images do no match")
    }

    func testSharedObjectManagerReturnsDefaultIfNoSaved() {
        let defaultSharedObject = SharedObject(image: UIImage(systemName: "snowflake")!, title: "Default Title X")
        let sut = SharedObjectManager()
        
        // Verify no data yet
        XCTAssertNil(defaults.data(forKey: key))
        
        // Verify that sut contains a SharedObject
        let sutSharedObject = sut.getCurrentSharedObject()
        
        XCTAssertNotNil(sutSharedObject)

        // Verify we get the correct data...
        XCTAssertEqual(sutSharedObject.title, defaultSharedObject.title)
        XCTAssertEqual(sutSharedObject.image.pngData()?.count, defaultSharedObject.image.pngData()?.count, "Images do no match")
    }
    

}
