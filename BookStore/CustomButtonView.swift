//
//  CustomButtonView.swift
//  BookStore
//
//  Created by amorn.narula on 26/3/24.
//

import SwiftUI

struct CustomButtonView: View {
    var body: some View {
        // Background rounded rectangle with angular gradient
        ZStack {
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .fill(
                    AngularGradient(
                        gradient: Gradient(colors: [.indigoMedium, .blue, .indigoMedium]),
                        center: .center
                    )
                )
            // Button content
            HStack(spacing: 8) {
                // Dollar sign image
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [.grayLight, .grayDark],
                                startPoint: .top,
                                endPoint: .bottom)
                        )
                    Circle()
                        .stroke(
                            LinearGradient(
                                colors: [.grayDark, .grayLight],
                                startPoint: .top,
                                endPoint: .bottom),
                            lineWidth: 4)
                    Image(systemName: "dollarsign")
                        .fontWeight(.black)
                        .font(.system(size: 24))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.greenMedium, .green, .greenMedium],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .padding(.all, 8)
                } //: ZStack
                // Button label "Buy Now"
                Text("Buy Now")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .frame(width: 76)
                    .padding(.all, 8)
            } //: HStack
            .frame(width: 58, height: 58)
        } //: ZStack
        .frame(height: 58)
    }
}


#Preview {
    CustomButtonView()
        .previewLayout(.sizeThatFits)
        .scenePadding()
}
