//
//  SharedObjectView.swift
//  ImageShareExtensionArticle
//
//  Created by Brent Michalski on 7/16/24.
//

import SwiftUI

struct SharedObjectView: TestableView {
    var viewInspectorHook: ((Self) -> Void)?  // Added for ViewInspector
    
    var sharedObjMgr: SharedObjectManager = SharedObjectManager()
    
    var body: some View {
        VStack {
            Image(uiImage: sharedObjMgr.getCurrentSharedObject().image)
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 250)
                .padding()
            
            Text(sharedObjMgr.getCurrentSharedObject().title)
                .font(.headline)
                .padding()
            
            Button {
                // Button action here
            } label: {
                Text("Test Button")
            }
            .id("testButton")
        }
        .onAppear { self.viewInspectorHook?(self) } // Added for ViewInspector
    }
}

//#Preview {
//    var sharedObjMgr = SharedObjectManager()
//    
//    var testSharedObject = SharedObject(
//        image: UIImage(systemName: "graduationcap.circle.fill")!,
//        title: "Test Preview Image"
//    )
//    
//    sharedObjMgr.setCurrentSharedObject(sharedObject: SharedObject(
//        image: UIImage(systemName: "gear")!,
//        title: "Hmmm")
//    )
//    
////    sharedObjMgr.setCurrentSharedObject(sharedObject: testSharedObject)
//    
////    sharedObjMgr.setCurrentSharedObject(sharedObject: testSharedObject)
//    
//    SharedObjectView(sharedObjMgr: sharedObjMgr)
//        .border(.gray, width: 2)
//}
