//
//  ContentView.swift
//  ImageShareExtensionArticle
//
//  Created by Brent Michalski on 7/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            SharedObjectView(
                sharedObject: SharedObject(
                    image: UIImage(named: "f35")!,
                    title: "F-35 Title"
                )
            )
            .border(.gray, width: 2)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
