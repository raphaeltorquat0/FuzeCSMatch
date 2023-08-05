//
//  OpponentImage.swift
//  FuzeCSMatch
//
//  Created by Raphael Buchler on 03/08/23.
//

import SwiftUI

struct MatchCard: View {
    var teamImage: String?
    var teamName: String?
    @State private var image: UIImage? = nil
    
    var body: some View {
        VStack {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
            } else {
                Color.gray
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
            }
            Text(teamName ?? "")
                .foregroundColor(Color.fromHex(Colors.textTitleColor.rawValue))
                .font(.caption)
            
        }.background(Color.fromHex(Colors.mainColor.rawValue))
            .onAppear {
                loadImage()
            }
    }
    
    private func loadImage() {
        guard let imageURL = URL(string: teamImage ?? "") else { return }
        
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

