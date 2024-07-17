//
//  ImageShareExtensionArticleTests.swift
//  ImageShareExtensionArticleTests
//
//  Created by Brent Michalski on 7/10/24.
//

import XCTest
import SwiftUI
@testable import ImageShareExtensionArticle

// MARK:  "SOM" = SharedObjectManager

final class ImageShareExtensionArticleTests: XCTestCase {
    let testDefaultSharedObject = SharedObject(image: UIImage(systemName: "snowflake") ?? UIImage(), title: "Default Title X")
    
    // Our key for userDefaults
    let key = "testSharedObject"
    let defaults = UserDefaults.standard
    
    override func setUpWithError() throws {
        defaults.removeObject(forKey: key)
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
    
    func testSOM_Init_noData_expectDefault() {
        let sut = SharedObjectManager()
        let testObject = sut.getCurrentSharedObject()
        
        XCTAssertEqual(testObject.title, "Default Title X")
        XCTAssertEqual(testObject.image.pngData()?.count, testDefaultSharedObject.image.pngData()?.count)
    }

    func testSOM_Init_WithData_expectData() {
        let expectedObject = SharedObject(image: UIImage(named: "f35") ?? UIImage(), title: "Expected F35")
        
        let sut = SharedObjectManager()
        sut.setCurrentSharedObject(sharedObject: expectedObject)
        
        let testObject = sut.getCurrentSharedObject()
        
        XCTAssertEqual(testObject.title, expectedObject.title)
        XCTAssertEqual(testObject.image.pngData()?.count, expectedObject.image.pngData()?.count)
    }

    func testSOM_FetchSharedObjectFromDataStore() {
        let expectedObject = SharedObject(image: UIImage(named: "f35") ?? UIImage(), title: "Expected F35")
        
        let sut = SharedObjectManager()
        sut.setCurrentSharedObject(sharedObject: expectedObject)
        
        let testObject = sut.fetchSharedObjectFromDataStore()
        
        XCTAssertEqual(testObject?.title, expectedObject.title)
        XCTAssertEqual(testObject?.image.pngData()?.count, expectedObject.image.pngData()?.count)
    }
    

}
