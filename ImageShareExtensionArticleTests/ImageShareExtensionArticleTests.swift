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
