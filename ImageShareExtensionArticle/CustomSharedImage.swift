//
//  CustomSharedImage.swift
//  ImageShareExtensionArticle
//
//  Created by Brent Michalski on 7/16/24.
//

import SwiftUI

struct CustomSharedImage {
    var image: UIImage
    var title: String
}

extension CustomSharedImage: Codable {
    enum CodingKeys: String, CodingKey {
        case image
        case title
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let imageData = try container.decode(Data.self, forKey: .image)
        self.image = UIImage(data: imageData) ?? UIImage()
        self.title = try container.decode(String.self, forKey: .title)
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        let imageData = image.pngData()
        try container.encode(imageData, forKey: .image)
        try container.encode(title, forKey: .title)
    }
}
