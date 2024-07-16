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
    let testSharedImage = CustomSharedImage(
        image: UIImage(systemName: "graduationcap.circle.fill")!,
        title: "Test Preview Image"
    )
    
    CustomSharedImageView(customSharedImage: testSharedImage)
        .border(.gray, width: 2)
}
