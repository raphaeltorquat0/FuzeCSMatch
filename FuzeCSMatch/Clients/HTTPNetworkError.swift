//
//  HTTPNetworkError.swift
//  FuzeCSMatch
//
//  Created by Raphael Buchler on 03/08/23.
//

import Foundation

enum NetworkError: Error {
    case badRequest
    case ServerError(String)
    case decodingError
    case invalidResponse
    case invalidURL
}
