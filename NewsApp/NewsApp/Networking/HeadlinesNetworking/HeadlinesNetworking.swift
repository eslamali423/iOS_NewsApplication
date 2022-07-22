//
//  HeadlinesNetworking.swift
//  NewsApp
//
//  Created by Eslam Ali  on 21/07/2022.
//

import Foundation
import Alamofire

enum HeadlinesNetworking {
    case getHeadlines
}

extension HeadlinesNetworking : TargetType {
    var baseUrl: String {
        get { return  Constants.baseUrl }
        set { }
    }
    
    var path: String {
        switch self {
        case .getHeadlines:
            return    "\(Constants.topHeadlines)\(Constants.query)\(Constants.language)\(NSLocale.preferredLanguages[0])\(Constants.apiKey)"
        }
    }
    
    var method: HTTPMethod {
        switch self  {
        case .getHeadlines :
            return .get
            
            
        }
    }
    
    var task: Task {
        switch self {
        case .getHeadlines:
            return .requestPlain
            
        }
    }
    
    var headers: [String : String]? {
        return [:]
    }
    
    
    
}

