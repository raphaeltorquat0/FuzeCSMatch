//
//  LeagueInfoView.swift
//  FuzeCSMatch
//
//  Created by Raphael Buchler on 03/08/23.
//

import SwiftUI

struct LeagueInfoView: View {
    var cMatch: Match?

    var body: some View {
        HStack {
            if let url = cMatch?.league?.image_url, let name = cMatch?.league?.name {
                AsyncImage(url: URL(string: url)) { phase in
                    switch phase {
                    case .empty:
                        Image(systemName: "person.fill")
                    case .success(let image):
                        image
                            .resizable()
                            .frame(width: 30, height: 30)
                    case .failure:
                        Image(systemName: "exclamationmark.icloud")
                    default:
                        Image(systemName: "exclamationmark.icloud")
                    }
                }
                Text(name)
            } else {
                Image(systemName: "person.fill")
                Text("Unable to load infos")
            }
            
        }
    }
}
