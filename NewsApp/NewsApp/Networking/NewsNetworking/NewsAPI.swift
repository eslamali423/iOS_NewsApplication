//
//  NewsAPI.swift
//  NewsApp
//
//  Created by Eslam Ali  on 20/07/2022.
//

import Foundation

//MARK:-  protocol oriented
protocol NewsAPIProtocol {
    func getData(completion: @escaping (Result<APIResponse?, NSError>)-> Void)
}

//MARK:- NewsAPI Class
class NewsAPI  : BaseAPI <NewsNetwroking> {

    func getData(completion: @escaping (Result<APIResponse?, NSError>)->Void) {
        self.fetchData(target: .getNews , responseClass: APIResponse.self) { (result) in
            completion(result)
        }
    }
    
    
}
