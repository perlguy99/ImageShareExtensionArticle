//
//  SharedObjectView.swift
//  ImageShareExtensionArticle
//
//  Created by Brent Michalski on 7/16/24.
//

import SwiftUI

struct SharedObjectView: View {
    let som = SharedObjectManager()
    
    var body: some View {
        VStack {
            Image(uiImage: som.getCurrentSharedObject().image)
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 250)
                .padding()
            
            Text(som.getCurrentSharedObject().title)
                .font(.headline)
                .padding()
        }
    }
}

#Preview {
    let som = SharedObjectManager()
    
    let testSharedObject = SharedObject(
        image: UIImage(systemName: "graduationcap.circle.fill")!,
        title: "Test Preview Image"
    )
    
    SharedObjectView()
        .border(.gray, width: 2)
}
