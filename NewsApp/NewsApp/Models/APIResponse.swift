//
//  APIResponse.swift
//  NewsApp
//
//  Created by Eslam Ali  on 20/07/2022.
//

import Foundation

// MARK: - APIResponse
struct APIResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
    let source: Source
    let author: String?
    let title, description: String
    let url: String
    let urlToImage: String
    let publishedAt: Date
    let content: String

}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String
}
