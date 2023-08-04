//
//  OpponentImage.swift
//  FuzeCSMatch
//
//  Created by Raphael Buchler on 03/08/23.
//

import SwiftUI

struct MatchCard: View {
    var opponent: Opponent?
    var body: some View {
        VStack {
            if let url = URL(string: opponent?.image_url ?? "") {
                AsyncImage(url: url) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                } placeholder: {
                    Color.gray
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                }
                .padding(.bottom, 8)
                .padding(.top, 4)
                Text(opponent?.name ?? "")
                    .foregroundColor(.white)
                    .font(.caption)
            } else {
                Color.gray
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    .padding(.bottom, 8)
                    .padding(.top, 4)
                Text(opponent?.name ?? "")
                    .foregroundColor(.white)
                    .font(.caption)
            }
            
        }
    }
}
