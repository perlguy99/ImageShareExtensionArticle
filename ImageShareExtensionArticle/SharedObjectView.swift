//
//  SharedObjectView.swift
//  ImageShareExtensionArticle
//
//  Created by Brent Michalski on 7/16/24.
//

import SwiftUI

struct SharedObjectView: View {
    var sharedObject: SharedObject
    
    var body: some View {
        VStack {
            Image(uiImage: sharedObject.image)
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 250)
                .padding()
            
            Text(sharedObject.title)
                .font(.headline)
                .padding()
        }
    }
}

#Preview {
    let testSharedObject = SharedObject(
        image: UIImage(systemName: "graduationcap.circle.fill")!,
        title: "Test Preview Image"
    )
    
    SharedObjectView(sharedObject: testSharedObject)
        .border(.gray, width: 2)
}
