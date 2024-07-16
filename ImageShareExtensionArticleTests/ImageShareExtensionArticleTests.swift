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

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws { }

    func testCreateCustomSharedImage() throws {
        let foo = Image(systemName: "gear")
        
        XCTAssertNoThrow(CustomSharedImage(image: Image(systemName: "gear"), title: "" ))

    }


}
