//
//  NewsAPI.swift
//  NewsApp
//
//  Created by Eslam Ali  on 20/07/2022.
//

import Foundation
import Alamofire

//MARK:-  protocol oriented
protocol NewsAPIProtocol {
    func getData(completion: @escaping (Result<APIResponse?, AFError>)-> Void)
}

//MARK:- NewsAPI Class
class NewsAPI  : BaseAPI <NewsNetwroking>, NewsAPIProtocol {

    func getData(completion: @escaping (Result<APIResponse?, AFError>)-> Void){
        self.fetchData(target: .getNews, responseClass: APIResponse.self) { (result) in
            completion(result)
        }
    }
    
    
}
