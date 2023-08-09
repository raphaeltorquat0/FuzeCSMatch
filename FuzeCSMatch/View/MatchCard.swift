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
                RemoteImage(url: teamImage)
                    .frame(width: 50, height: 50)
                    .padding(.top, 30)
                    .background(Color.clear)
                VStack(spacing: 10) {
                    Spacer().frame(minHeight: 30)
                    Text(teamName)
                        .font(.custom(Constants.CFRoboto.robotoMedium, size: 15))
                        .foregroundColor(Color.fromHex(Colors.textTitleColor.rawValue))
                        .lineLimit(2)
                }
            }
            .background(Color.clear)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100, maxHeight: 100)
            .padding()
            .cornerRadius(20)
        }
    }
}

struct RemoteImage: View {
    private var url: URL?
    
    init(url: String) {
        self.url = URL(string: url)
    }
    
    var body: some View {
            if let url = url {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    Image("teamA_placeholder")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            } else {
                Image("teamA_placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
}

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private let url: URL
    
    init(url: String) {
        self.url = URL(string: url)!
        downloadImage()
    }
    
    private func downloadImage() {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let loadedImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = loadedImage
                }
            }
        }.resume()
    }
}
