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
    
    func test_viewCanBeChanged() throws {
        let sharedObjMgr = SharedObjectManager()
        let view = SharedObjectView(sharedObjMgr: sharedObjMgr)
        
        view.sharedObjMgr.setCurrentSharedObject(sharedObject: SharedObject(image: UIImage(systemName: "gear") ?? UIImage(), title: "FIRST"))
        print(view.sharedObjMgr.getCurrentSharedObject().title)
        
        view.sharedObjMgr.setCurrentSharedObject(sharedObject: SharedObject(image: UIImage(systemName: "gear") ?? UIImage(), title: "SECOND"))
        print(view.sharedObjMgr.getCurrentSharedObject().title)
        
        
    }
}
