//
//  LeagueInfoView.swift
//  FuzeCSMatch
//
//  Created by Raphael Buchler on 03/08/23.
//

import SwiftUI

struct LeagueInfoView: View {
    var leagueName: String
    var leagueImage: String
    @State private var image: UIImage? = UIImage(contentsOfFile: "splash_logo")
    
    var body: some View {
        ZStack {
            VStack(spacing: 10) {
                Image(leagueImage)
                HStack(spacing: 10) {
                    Text(leagueName)
                        .font(.custom("Roboto-Thin", size: 10))
                        .foregroundColor(Color.fromHex(Colors.textTitleColor.rawValue))
                        .frame(width: .infinity, height: .infinity, alignment: .bottomLeading)
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 200, maxHeight: 200)
            .padding(10)
        }
    }
}
