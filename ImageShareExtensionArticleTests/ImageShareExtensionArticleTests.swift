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
    override func setUpWithError() throws { }
    override func tearDownWithError() throws { }

    func testCreateCustomSharedImage() throws {
        let testImage = UIImage(systemName: "gear")!
        
        XCTAssertNoThrow(CustomSharedImage(image: testImage, title: "" ))
    }

}
