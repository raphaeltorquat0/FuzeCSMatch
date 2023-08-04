//
//  HTTPResource.swift
//  FuzeCSMatch
//
//  Created by Raphael Buchler on 03/08/23.
//

import Foundation

struct PaginatedResource<T: Codable> {
    let url: URL
    let method: HTTPMethod = .get([])
    var modelType: T.Type
    let queryItems: [URLQueryItem] = [
        URLQueryItem(name: "page[size]", value: "\(Constants.URLS.pageSize)"),
        URLQueryItem(name: "page[number]", value: "\(Constants.URLS.currentPage)")
    ]
}

struct PaginatedResult<T: Codable>: Codable {
    let items:T
}
