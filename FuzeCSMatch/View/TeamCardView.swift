//
//  TeamCardView.swift
//  FuzeCSMatch
//
//  Created by Raphael Buchler on 04/08/23.
//

import SwiftUI
import Foundation

struct TeamMemberImage: View {
    var imagedName: String
    var body: some View {
        Image(imagedName)
            .resizable()
            .frame(width: 100, height: 100)
            .clipShape(RoundedRectangle(cornerRadius: 12)).offset(x: 200)
    }
}

struct TeamMemberDetails: View {
    var body: some View {
        VStack(alignment: .trailing) {
            Text("Member NickName")
                .foregroundColor(Color.fromHex(Colors.textTitleColor.rawValue))
                .offset(x: -100)
            Text("Member Name")
                .foregroundColor(Color.fromHex(Colors.textSubTileColor.rawValue))
                .offset(x: -120)
        }.frame(width: 200)
            .foregroundColor(Color.fromHex(Colors.mainColor.rawValue))
            
    }
}

struct MockStore {
    static var Teams = [
        Match.OpponentDetalhes(acronym: "21", id: 0, image_url: "", location: "", modified_at: "", name: "", slug: ""),
        Match.OpponentDetalhes(acronym: "21", id: 0, image_url: "", location: "", modified_at: "", name: "", slug: ""),
        Match.OpponentDetalhes(acronym: "21", id: 0, image_url: "", location: "", modified_at: "", name: "", slug: ""),
        Match.OpponentDetalhes(acronym: "21", id: 0, image_url: "", location: "", modified_at: "", name: "", slug: ""),
        Match.OpponentDetalhes(acronym: "21", id: 0, image_url: "", location: "", modified_at: "", name: "", slug: "")
    ]
}


struct RowView: View {
    let teamMembers: [Match.OpponentDetalhes]
    let width: CGFloat
    let height: CGFloat
    let horizontalSpacing: CGFloat
    
    var body: some View {
        HStack(spacing: horizontalSpacing) {
            ForEach(teamMembers) { member in
                TeamMemberImage(imagedName: member.image_url ?? "")
                TeamMemberDetails()
            }
        }.padding()
    }
        
}

struct MatchDetailView: View {
    let itemPerRow: CGFloat = 2
    let horizontalSpacing: CFloat = 16
    let height: CGFloat = 200
    
    let teamMembers: [Match.OpponentDetalhes] = [
        Match.OpponentDetalhes(acronym: "21", id: 0, image_url: "", location: "", modified_at: "", name: "", slug: ""),
        Match.OpponentDetalhes(acronym: "21", id: 0, image_url: "", location: "", modified_at: "", name: "", slug: ""),
        Match.OpponentDetalhes(acronym: "21", id: 0, image_url: "", location: "", modified_at: "", name: "", slug: ""),
        Match.OpponentDetalhes(acronym: "21", id: 0, image_url: "", location: "", modified_at: "", name: "", slug: ""),
        Match.OpponentDetalhes(acronym: "21", id: 0, image_url: "", location: "", modified_at: "", name: "", slug: "")
    ]
    
    
    
    private func buildView(rowIndex: Int, geometry: GeometryProxy) -> RowView? {
        var rowItems = teamMembers
        for itemIndex in 0..<Int(itemPerRow) {
            if rowIndex + itemIndex < rowItems.count {
                rowItems.append(teamMembers[rowIndex + itemIndex])
            }
        }
        if !rowItems.isEmpty {
            return RowView(teamMembers: teamMembers, width: getWidth(geometry: geometry), height: height, horizontalSpacing: CGFloat(horizontalSpacing))
        }
        return nil
    }
    
    func getWidth(geometry: GeometryProxy) -> CGFloat {
        let width: CGFloat = (geometry.size.width - CGFloat(horizontalSpacing) * (itemPerRow + 1)) / itemPerRow
        return width
    }
    
    var body: some View {
        
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .leading,spacing: 8) {
                    ForEach(0..<20) { i in
                        if i % Int(itemPerRow) == 0 {
                            buildView(rowIndex: i, geometry: geometry)
                        }
                    }
                }
            }
        }
        
//        List {
//            ScrollViewReader { ScrollViewProxy in
//                HStack(spacing: 5) {
//                    MatchCard(teamImage: firstTeamImage, teamName: firstTeamName).frame(maxWidth: .infinity)
//                    Text("VS")
//                        .foregroundColor(Color.fromHex(Colors.textTitleColor.rawValue))
//                        .font(.headline)
//                    MatchCard(teamImage: secondTeamImage, teamName: secondTeamName).frame(maxWidth: .infinity)
//                }.frame(height:300)
//
//                .background(Color.fromHex(Colors.mainColor.rawValue))
//                .padding()
//
//                VStack(spacing: 5) {
//                    HStack(spacing: 5) {
//                        TeamMemberImage(imagedName: "splash_logo")
//                        TeamMemberDetails()
//                    }.background(Color.fromHex(Colors.mainColor.rawValue)).cornerRadius(15)
//                }
//
//                VStack(spacing: 5) {
//                    HStack(spacing: 5) {
//                        TeamMemberImage(imagedName: "splash_logo")
//                        TeamMemberDetails()
//                    }.background(Color.fromHex(Colors.mainColor.rawValue)).cornerRadius(15)
//                }
//
//                VStack(spacing: 5) {
//                    HStack(spacing: 5) {
//                        TeamMemberImage(imagedName: "splash_logo")
//                        TeamMemberDetails()
//                    }.background(Color.fromHex(Colors.mainColor.rawValue)).cornerRadius(15)
//                }
//            }
//
//
//        }.background(Color.fromHex(Colors.mainColor.rawValue))
//            .scrollContentBackground(.hidden)
    }
}


struct MatchDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MatchDetailView()
    }
}
