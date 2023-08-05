//
//  LeagueInfoView.swift
//  FuzeCSMatch
//
//  Created by Raphael Buchler on 03/08/23.
//

import SwiftUI

struct LeagueInfoView: View {
    var leagueName: String?
    var leagueImage: String?
    @State private var image: UIImage? = nil

    var body: some View {
        HStack {
            
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
            } else {
                Image(systemName: "exclamationmark.icloud")
            }
            Text(leagueName ?? "")
                .foregroundColor(Color.fromHex(Colors.textTitleColor.rawValue))
                .font(.caption)
            
            
//            if let url = leagueImage, let name = leagueName {
//                AsyncImage(url: URL(string: url)) { phase in
//                    switch phase {
//                    case .empty:
//                        Image(systemName: "person.fill")
//                    case .success(let image):
//                        image
//                            .resizable()
//                            .frame(width: 30, height: 30)
//                    case .failure:
//                        Image(systemName: "exclamationmark.icloud")
//                    default:
//                        Image(systemName: "exclamationmark.icloud")
//                    }
//                }
//                Text(name)
//            } else {
//                Image(systemName: "person.fill")
//                Text("Unable to load infos")
//            }
        }.onAppear {
            loadImage()
        }
    }
    
    private func loadImage() {
        guard let imageURL = URL(string: leagueImage ?? "") else { return }
        
        DispatchQueue.global().async {
            do {
                let imageData = try Data(contentsOf: imageURL)
                if let loadedImage = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        image = loadedImage
                    }
                }
            } catch {
                print("Error loading image: \(error)")
            }
        }
    }
}
