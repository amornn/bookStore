import SwiftUI

struct RotatingOverlappingImageStackView: View {
    @State private var rotation: Double = 0
    
    let imageName = "harry_potter_1" // Replace "card_back" with the name of your image asset
    let numberOfImages = 52 // Total number of images in the circular layout
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                let center = CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2)
                let radius: CGFloat = min(geometry.size.width, geometry.size.height) / 3 // Radius for circular layout
                
                ZStack {
                    ForEach(0..<numberOfImages, id: \.self) { index in
                        Image(imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 80) // Adjust the size of each card
                            .rotationEffect(.degrees(Double(index) * (360.0 / Double(numberOfImages))), anchor: .center) // Rotate each image
                            .position(
                                x: center.x + radius * cos(Double(index) * 2 * .pi / Double(numberOfImages)),
                                y: center.y + radius * sin(Double(index) * 2 * .pi / Double(numberOfImages))
                            )
                    }
                }
            }
            .frame(height: 400) // Adjust height to fit your design
            
            Slider(value: $rotation, in: 0...360, step: 1) {
                Text("Rotation")
            }
            .padding()
        }
        .padding()
    }
}

struct RotatingOverlappingImageStackView_Previews: PreviewProvider {
    static var previews: some View {
        RotatingOverlappingImageStackView()
    }
}
