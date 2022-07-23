//
//  Constants.swift
//  NewsApp
//
//  Created by Eslam Ali  on 20/07/2022.
//

import Foundation


struct Constants {
    //https://newsapi.org/v2/top-headlines?country=US&apikey=8f55ac14583d442db89ff49a92cd491f
    /// https://newsapi.org/v2/everything?q=Apple&sortBy=popularity&apiKey=8f55ac14583d442db89ff49a92cd491f
    /// https://newsapi.org/v2/everything?q=bitcoin&apiKey=8f55ac14583d442db89ff49a92cd491f
    //https://newsapi.org/v2/top-headlines?q=&language=en&apiKey=ec2b8d064e274580b1791a1ee1b980cc
    static let baseUrl = "https://newsapi.org/v2/"
    static let everything = "everything?"
    static let topHeadlines = "top-headlines?"
    static let countery = "country=US&"
    static let language = "&language="
    static let query = "q=a"
    static let apiKey = "&apiKey=ec2b8d064e274580b1791a1ee1b980cc"
    
    static let searchURL = "https://newsapi.org/v2/everything?sortedBy=popularity&apikey=8f55ac14583d442db89ff49a92cd491f&q="
    
    
}


