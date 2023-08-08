//
//  BadgeView.swift
//  FuzeCSMatch
//
//  Created by Raphael Buchler on 08/08/23.
//

import SwiftUI

struct BadgeView: View {
    var title: String
    var padding: CGFloat
    var radius: CGFloat
    var rotation: Double
    var xOffset: CGFloat
    var yOffset: CGFloat
    
    
    var body: some View {
        Text(title)
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


struct BadgeView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeView(title: "agora", padding: 5, radius: 10, rotation: +35, xOffset: +125, yOffset: -70)
    }
}
