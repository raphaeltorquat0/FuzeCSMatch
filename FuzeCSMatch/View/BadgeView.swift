import SwiftUI

struct BadgeView: View {
    var badgeText: String
    var padding: CGFloat
    var radius: CGFloat
    var rotation: Double
    var xOffset: CGFloat
    var yOffset: CGFloat
    
    var body: some View {
        Text(badgeText)
            .font(.callout)
            .fontWeight(.bold)
            .padding(padding)
            .background(Color.fromHex(Colors.liveColor.rawValue))
            .foregroundColor(.white)
            .cornerRadius(radius)
            .rotationEffect(.degrees(rotation))
            .offset(x: xOffset, y: yOffset)
    }
}
