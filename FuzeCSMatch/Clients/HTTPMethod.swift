//
//  HTTPMethod.swift
//  FuzeCSMatch
//
//  Created by Raphael Buchler on 03/08/23.
//

import Foundation

enum HTTPMethod {
    case get([URLQueryItem])
    case post(Data?)
    
    var name: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        }
    }
}
