//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Eslam Ali  on 20/07/2022.
//

import Foundation
import RxCocoa
import RxSwift

class NewsViewModel {
    //MARK:- Vars
    var newsApi = NewsAPI()
   
    var newsBehaviorSubject = BehaviorSubject(value: [Article]())

    //MARK:- Methods
    func getNews(completion : @escaping (Bool)-> Void){
        newsApi.getData { (result) in
            switch result {
            case .success(let response):
                self.newsBehaviorSubject.on(.next(response?.articles ?? []))
                print(response?.articles)
                completion(true)
            case .failure(let error):
                print("Error geting data in viewModel")
                print(error)
                completion(false)
            }
        }
        
        
    }
    
    
    
}
