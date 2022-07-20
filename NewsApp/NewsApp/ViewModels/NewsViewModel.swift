//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Eslam Ali  on 20/07/2022.
//

import Foundation

class NewsViewModel {
    //MARK:- Vars
    var newsApi = NewsAPI()
    
    //MARK:- Methods
    func getNews(completion : @escaping (Bool)-> Void){
        newsApi.getData { (result) in
            switch result {
            case .success(let response):
                print(response!.articles)
                completion(true)
            case .failure(let error):
                print(error)
                completion(false)
            }
        }
        
        
    }
    
    
    
}
