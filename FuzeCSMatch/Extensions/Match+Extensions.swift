//
//  Match+Extensions.swift
//  FuzeCSMatch
//
//  Created by Raphael Buchler on 03/08/23.
//

import Foundation

extension Match: Identifiable, Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: Match, rhs: Match) -> Bool {
        return lhs.id == rhs.id
    }
}
