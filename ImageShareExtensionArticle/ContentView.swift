//
//  ContentView.swift
//  ImageShareExtensionArticle
//
//  Created by Brent Michalski on 7/10/24.
//

import SwiftUI

//sharedObject: SharedObject(
//    image: UIImage(named: "f35")!,
//    title: "F-35 Title"
//)

struct ContentView: View {
    var sharedObjMgr = SharedObjectManager()
    
    var body: some View {
        VStack {
            SharedObjectView(sharedObjMgr: sharedObjMgr)
            .border(.gray, width: 2)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
