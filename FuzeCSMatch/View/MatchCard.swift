//
//  OpponentImage.swift
//  FuzeCSMatch
//
//  Created by Raphael Buchler on 03/08/23.
//

import SwiftUI

struct MatchCard: View {
    var teamImage: String
    var teamName: String
    @State private var image: UIImage? = nil
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Image(teamImage)
                    .font(.system(size: 50))
                    .frame(width: 50, height: 50)
                    .padding(.bottom, 10)
                VStack(spacing: 1) {
                    Text(teamName)
                        .font(.custom("Roboto-Medium", size: 15))
                        .foregroundColor(Color.fromHex(Colors.textTitleColor.rawValue))
                        .frame(width: .infinity, height: 50, alignment: .bottomLeading)
                        .lineLimit(2)
                }
            }
            .background(Color.fromHex(Colors.mainColor.rawValue))
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100, maxHeight: 100)
            .padding(10)
        }
    }
}

