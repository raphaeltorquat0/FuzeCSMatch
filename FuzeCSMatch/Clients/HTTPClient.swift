//
//  HTTPClient.swift
//  FuzeCSMatch
//
//  Created by Raphael Buchler on 03/08/23.
//

import Foundation

struct HTTPClient {
    func load<T: Codable>(_ resource: PaginatedResource<T>) async throws -> PaginatedResult<T> {
        var request = URLRequest(url: resource.url)
        
        switch resource.method {
        case .get:
            var components = URLComponents(url: resource.url, resolvingAgainstBaseURL: false)
            components?.queryItems = resource.queryItems
            guard let url = components?.url else {
                throw NetworkError.badRequest
            }
            request = URLRequest(url: url)
            
        case .post(let data):
            request.httpMethod = resource.method.name
            request.httpBody = data
        }
        
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(Constants.accessToken)"
        ]
        let session = URLSession(configuration: configuration)
        let (data, response) = try await session.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        guard httpResponse.statusCode == 200 else {
            // Handle other status codes, e.g., 404, 500, etc.
            throw NetworkError.ServerError(httpResponse.description)
        }
        
       do {
            let result = try JSONDecoder().decode(T.self, from: data)
            let paginatedResult = PaginatedResult<T>(items: result)
            return paginatedResult
        } catch let error {
            print("Decoding Error: \(error)")
            throw NetworkError.decodingError
        }
    }
}
