//
//  HeadlinesAPI.swift
//  NewsApp
//
//  Created by Eslam Ali  on 21/07/2022.
//

import Foundation
import Alamofire

//MARK:-  protocol oriented
protocol HeadlinesAPIProtocol {
    func getData(completion: @escaping (Result<APIResponse?, AFError>)-> Void)
}

//MARK:- NewsAPI Class
class HeadlinesAPI  : BaseAPI <HeadlinesNetworking>, HeadlinesAPIProtocol {

    func getData(completion: @escaping (Result<APIResponse?, AFError>)-> Void){
        self.fetchData(target: .getHeadlines, responseClass: APIResponse.self) { (result) in
            completion(result)
        }
    }
    
    
}
