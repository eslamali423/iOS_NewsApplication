//
//  HeadlinesViewModell.swift
//  NewsApp
//
//  Created by Eslam Ali  on 21/07/2022.
//

import Foundation
import RxCocoa
import RxSwift

class HeadlinesViewModell {
    //MARK:- Vars
    var headlinesAPI = HeadlinesAPI()
   
    var headlinesBehaviorSubject = BehaviorSubject(value: [Article]())

    //MARK:- Methods
    func getHeadlines(completion : @escaping (Bool)-> Void){
        headlinesAPI.getData { (result) in
          switch result  {
            case .success(let response):
                self.headlinesBehaviorSubject.on(.next(response?.articles ?? []))
                completion(true)
            case .failure(let error):
                print("Error geting data in viewModel")
                print(error)
                
                completion(false)
            }

        }
        
        
    }
    
    
    
}
