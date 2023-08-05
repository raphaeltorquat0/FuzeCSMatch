//
//  MatchDetail.swift
//  FuzeCSMatch
//
//  Created by Raphael Buchler on 04/08/23.
//

import SwiftUI

struct MatchDetail: View {
    var match: Match
    @State private var isPresented: Bool = false
    @EnvironmentObject private var model: MatchesModel
    
    private func fetchMatchInfo() async throws {
        do {
            guard let id = match.id else {
                throw NetworkError.badRequest
            }
            let _ = try await model.getDetailFromMatch(id)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    var body: some View {
        Text("Oi =)")
    }
}

