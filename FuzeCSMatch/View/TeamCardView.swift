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
            .frame(width: 80, height: 80)
            .clipShape(RoundedRectangle(cornerRadius: 12)).offset(x: 150)
    }
}

struct TeamMemberDetails: View {
    let teamMemberNickName: String
    let teamMemberName: String
    
    var body: some View {
        VStack(alignment: .trailing) {
            Text(teamMemberNickName)
                .foregroundColor(Color.fromHex(Colors.textTitleColor.rawValue))
                .offset(x: -120)
            Text(teamMemberName)
                .foregroundColor(Color.fromHex(Colors.textSubTileColor.rawValue))
                .offset(x: -120, y: 10)
        }.frame(width: 200)
            .foregroundColor(Color.fromHex(Colors.mainColor.rawValue))
        
            
    }
}

struct MockStore {
    static var Teams = [
        Match.OpponentDetalhes(acronym: "21", id: 0, image_url: "splash_logo", location: "", modified_at: "2023-08-03", name: "CS_GO", slug: "slug_0"),
        Match.OpponentDetalhes(acronym: "22", id: 1, image_url: "splash_logo", location: "", modified_at: "2023-08-03", name: "CS_GO", slug: "slug_1"),
        Match.OpponentDetalhes(acronym: "23", id: 2, image_url: "splash_logo", location: "", modified_at: "2023-08-03", name: "CS_GO", slug: "slug_2"),
        Match.OpponentDetalhes(acronym: "24", id: 3, image_url: "splash_logo", location: "", modified_at: "2023-08-03", name: "CS_GO", slug: "slug_3"),
        Match.OpponentDetalhes(acronym: "25", id: 4, image_url: "splash_logo", location: "", modified_at: "2023-08-03", name: "CS_GO", slug: "slug_4")
    ]
}


struct RowView: View {
    var teamMembers: [Match.OpponentDetalhes]
    let width: CGFloat
    let height: CGFloat
    let horizontalSpacing: CGFloat
    
    var body: some View {
        HStack(spacing: horizontalSpacing) {
            ForEach(teamMembers) { member in
                TeamMemberImage(imagedName: (teamMembers.first!.image_url)!)
                TeamMemberDetails(teamMemberNickName: teamMembers.first!.name, teamMemberName: teamMembers.first!.name)
            }
        }.padding()
    }
        
}

struct MatchDetailView: View {
    let itemPerRow: CGFloat = 2
    let horizontalSpacing: CFloat = 16
    let height: CGFloat = 200
    
    let teamMembers: [Match.OpponentDetalhes] = [
        Match.OpponentDetalhes(acronym: "21", id: 0, image_url: "splash_logo", location: "CS-GO", modified_at: "CS-GO", name: "CS-GO", slug: "CS-GO"),
        Match.OpponentDetalhes(acronym: "22", id: 1, image_url: "splash_logo", location: "CS-GO", modified_at: "CS-GO", name: "CS-GO", slug: "CS-GO"),
        Match.OpponentDetalhes(acronym: "23", id: 2, image_url: "splash_logo", location: "CS-GO", modified_at: "CS-GO", name: "CS-GO", slug: "CS-GO"),
        Match.OpponentDetalhes(acronym: "24", id: 3, image_url: "splash_logo", location: "CS-GO", modified_at: "CS-GO", name: "CS-GO", slug: "CS-GO"),
        Match.OpponentDetalhes(acronym: "25", id: 4, image_url: "splash_logo", location: "CS-GO", modified_at: "CS-GO", name: "CS-GO", slug: "CS-GO"),
        Match.OpponentDetalhes(acronym: "25", id: 4, image_url: "splash_logo", location: "CS-GO", modified_at: "CS-GO", name: "CS-GO", slug: "CS-GO")
    ]
    
    
    
    private func buildView(rowIndex: Int, geometry: GeometryProxy) -> RowView? {
        var rowItems = teamMembers
        for itemIndex in 0..<Int(itemPerRow) {
            if rowIndex + itemIndex < rowItems.count - 1 {
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
        
        ScrollViewReader { scrollViewProxy in
            HStack(spacing: 5) {
                MatchCard(teamImage: "splash_logo", teamName: "team_A").frame(maxWidth: .infinity).offset(x: 40)
                Text("VS")
                    .foregroundColor(Color.fromHex(Colors.textSubTileColor.rawValue))
                MatchCard(teamImage: "splash_logo", teamName: "team_A").frame(maxWidth: .infinity).offset(x: -40)
            }.frame(height: 300)
                .background(Color.fromHex(Colors.mainColor.rawValue))
            VStack {
                Text("HOJE")
                    .foregroundColor(Color.fromHex(Colors.textTitleColor.rawValue))
                    .offset(y: -50)
            }
                
            Divider()
            GeometryReader { geometry in
                ScrollView {
                    VStack(alignment: .leading,spacing: 8) {
                        ForEach(0..<teamMembers.count) { i in
                            if i % Int(itemPerRow) == 0 {
                                buildView(rowIndex: i, geometry: geometry)
}
                        }
                    }
                }.background(Color.fromHex(Colors.mainColor.rawValue))
            }.scrollContentBackground(.hidden)
        }
    }
}


struct MatchDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MatchDetailView().foregroundColor(Color.fromHex(Colors.mainColor.rawValue))
    }
}
