//
//  NewsNetworking.swift
//  NewsApp
//
//  Created by Eslam Ali  on 20/07/2022.
//

import Foundation
import Alamofire

enum NewsNetwroking {
    case getNews
}
extension NewsNetwroking : TargetType {
    var baseUrl: String {
        get { return  Constants.baseUrl }
        set { }
    }
    
    var path: String {
        switch self {
        case .getNews:
        return    "\(Constants.everything)\(Constants.query)\(Constants.language)\(NSLocale.preferredLanguages[0])\(Constants.apiKey)"
        }
    }
    
    var method: HTTPMethod {
        switch self  {
        case .getNews :
            return .get
            
            
        }
    }
    
    var task: Task {
        switch self {
        case .getNews:
            return .requestPlain
            
        }
    }
    
    var headers: [String : String]? {
        return [:]
    }
    
    
    
}










