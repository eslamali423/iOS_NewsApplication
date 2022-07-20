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
   
    let author: String?
    let title: String
    let url: String
    let description: String
    let urlToImage: String
    let publishedAt: String
    let content: String

   

  
}
