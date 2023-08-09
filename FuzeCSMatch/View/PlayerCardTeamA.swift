//
//  PlayerCard.swift
//  FuzeCSMatch
//
//  Created by Raphael Buchler on 08/08/23.
//

import SwiftUI

struct PlayerCardTeamA: View {
    var playerName: String
    var playerNickName: String
    var playerImage: String
    
    var body: some View {
        ZStack {
            HStack(alignment: .center, spacing: 0) {
                Spacer()
                
                VStack(alignment: .trailing, spacing: 0) {
                    Spacer()
                    Text(playerNickName)
                        .font(.custom(Constants.CFRoboto.robotoMedium, size: 15))
                        .foregroundColor(Color.fromHex(Colors.textTitleColor.rawValue))
                        .lineLimit(2)
                        .padding(.bottom, 5)
                    Text(playerName)
                        .font(.custom(Constants.CFRoboto.robotoLight, size: 10))
                        .foregroundColor(Color.fromHex(Colors.textSubTileColor.rawValue))
                        .lineLimit(1)
                        .padding(.top, 5)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                Image(playerImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .offset(y: -30)
            }
            .padding(10)
            .frame(height: 100)
            .background(Color.fromHex(Colors.mainColor.rawValue))
            .cornerRadius(10)
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct PlayerCardTeamB: View {
    let playerNickName: String
    let playerName: String
    let playerImage: String
    
    var body: some View {
        ZStack {
            HStack(alignment: .center, spacing: 10) {
                Image(playerImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .offset(y: -30)
                
                VStack(alignment: .leading, spacing: 0) {
                    Spacer()
                    Text(playerNickName)
                        .font(.custom(Constants.CFRoboto.robotoMedium, size: 15))
                        .foregroundColor(Color.fromHex(Colors.textTitleColor.rawValue))
                        .lineLimit(2)
                        .padding(.bottom, 5)
                    Text(playerName)
                        .font(.custom(Constants.CFRoboto.robotoLight, size: 10))
                        .foregroundColor(Color.fromHex(Colors.textSubTileColor.rawValue))
                        .lineLimit(1)
                        .padding(.top, 5)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(10)
            .frame(height: 100)
            .background(Color.fromHex(Colors.mainColor.rawValue))
            .cornerRadius(10)
            .edgesIgnoringSafeArea(.all)
        }
    }
    
}


struct PlayerCard_Previews: PreviewProvider {
    static var previews: some View {
        PlayerCardTeamA(playerName: "player_name", playerNickName: "player_nickname", playerImage: "splash_logo")
    }
}


