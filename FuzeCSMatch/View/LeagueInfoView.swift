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
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            RemoteImage(url: leagueImage)
                .frame(width: 30, height: 30)
                .aspectRatio(contentMode: .fit)
                .background(Color.fromHex(Colors.mainColor.rawValue))
                .clipShape(Circle())
            Text(leagueName)
                    .font(.custom(Constants.CFRoboto.robotoMedium, size: 10))
                    .foregroundColor(Color.fromHex(Colors.textTitleColor.rawValue))
                    .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
    }
}
