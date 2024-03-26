//
//  Image+Extensions.swift
//  BookStore
//
//  Created by amorn.narula on 26/3/24.
//

import SwiftUI

extension Image {
    // A modifier for configuring the size of the image
    func imageModifier(maxWidth: CGFloat? = nil, maxHeight: CGFloat? = nil) -> some View {
        self
            .resizable() // Make the image resizable
            .scaledToFit() // Maintain aspect ratio while fitting within the frame
            .frame(
                maxWidth: maxWidth, // Set the maximum width of the image frame
                maxHeight: maxHeight // Set the maximum height of the image frame
            )
    }
}
