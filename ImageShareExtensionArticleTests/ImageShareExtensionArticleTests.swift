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
    func testCreateCustomSharedImage() throws {
        let testImage = UIImage(systemName: "gear")!
        XCTAssertNoThrow(CustomSharedImage(image: testImage, title: "" ))
    }
    
    func testSaveAndRetrieveCustomSharedImage() {
        // Create a CustomSharedImage instance
        let originalImage = UIImage(systemName: "star.fill")!
        let originalTitle = "Test Image"
        let originalCustomSharedImage = CustomSharedImage(image: originalImage, title: originalTitle)
        
        // Our key for userDefaults
        let key = "testCustomSharedImage"
        
        // Save to UserDefaults
        let defaults = UserDefaults.standard
        if let encoded = try? JSONEncoder().encode(originalCustomSharedImage) {
            defaults.set(encoded, forKey: key)
        }
        
        // Retrieve from UserDefaults
        guard let savedData = defaults.data(forKey: key),
              let retrievedCustomSharedImage = try? JSONDecoder().decode(CustomSharedImage.self, from: savedData) else {
            XCTFail("Failed to retrieve CustomSharedImage from UserDefaults")
            return
        }
        
        // Assert that the retrieved CustomSharedImage matches the original
        XCTAssertEqual(originalCustomSharedImage.title, retrievedCustomSharedImage.title, "Titles do not match")
        XCTAssertEqual(originalCustomSharedImage.image.pngData()?.count, retrievedCustomSharedImage.image.pngData()?.count, "Images do no match")
    }
}













//final class ImageShareExtensionArticleTests: XCTestCase {
//    override func setUpWithError() throws { }
//    override func tearDownWithError() throws { }
//
//    func testCreateCustomSharedImage() throws {
//        let testImage = UIImage(systemName: "gear")!
//        XCTAssertNoThrow(CustomSharedImage(image: testImage, title: "" ))
//    }
//    
//    func testAbilityToSaveAndRetrieveCustomSharedImageObject() {
//        let customSharedImage1 = CustomSharedImage(image: UIImage(systemName: "gear")!, title: "Test CustomSharedImage1")
//        let customSharedImage2 = CustomSharedImage(image: UIImage(systemName: "link")!, title: "Test CustomSharedImage2")
//    }
//}
