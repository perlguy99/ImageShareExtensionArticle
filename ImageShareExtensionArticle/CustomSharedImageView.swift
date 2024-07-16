//
//  CustomSharedImageView.swift
//  ImageShareExtensionArticle
//
//  Created by Brent Michalski on 7/16/24.
//

import SwiftUI

struct CustomSharedImageView: View {
    var customSharedImage: CustomSharedImage
    
    var body: some View {
        VStack {
            Image(uiImage: customSharedImage.image)
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 250)
                .padding()
            
            Text(customSharedImage.title)
                .font(.headline)
                .padding()
        }
    }
}

#Preview {
    let testImage = UIImage(systemName: "graduationcap.circle.fill")!
    let testTitle = "Test Image"
    let testSharedImage = CustomSharedImage(image: testImage, title: testTitle)
    
    CustomSharedImageView(customSharedImage: testSharedImage)
        .border(.gray, width: 2)
}
