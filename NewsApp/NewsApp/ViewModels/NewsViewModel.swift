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
//                if ((response?.articles.isEmpty) != nil) {
//                    UserDefaults.standard.setValue(true , forKey: "isEmptyArticle")
//                }else {
//                    UserDefaults.standard.setValue(false , forKey: "isEmptyArticle")
//
//                }
                completion(true)
            case .failure(let error):
                print(error)
                completion(false)
            }
        }
   
    }
    //MARK:- Srarch
    func search (with query :  String, completion : @escaping (Bool)-> Void){
        guard !query.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
         let urlString = Constants.searchURL + query
        guard let url = URL (string: urlString) else {
           // faild to reatch URL
           return
       }
  // success to get the URL
       let task  =  URLSession.shared.dataTask(with: url) { (data, _, error) in
           if let error = error {
               completion(false)
           } else if let data =  data  {

               do {
          let result = try JSONDecoder().decode(APIResponse.self, from: data)
                self.newsBehaviorSubject.on(.next(result.articles ))
                completion(true)
               } catch{
                   completion(false)
               }


           }
           
       }
       task.resume()
        
        
   }
    
    
    
    
}
