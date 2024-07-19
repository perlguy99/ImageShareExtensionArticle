import XCTest
import SwiftUI
@testable import ViewInspector
@testable import ImageShareExtensionArticle

final class SharedObjectViewTests: XCTestCase {
    
    @MainActor func test_buttonWithTestIdExists() throws {
        // Arrange
        var view = SharedObjectView()
        
        // Act & Assert
        inspectChangingView(&view) { sut in
            // Act
            let button = try sut.find(viewWithId: "testButton")
            
            // Assert
            XCTAssertNotNil(button)
        }
    }
}
