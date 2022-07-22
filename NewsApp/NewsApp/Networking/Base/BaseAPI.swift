//
//  BaseAPI.swift
//  NewsApp
//
//  Created by Eslam Ali  on 20/07/2022.
//

import Foundation
import Alamofire

enum APIError :Error  {
    case faildToGetData
}

class BaseAPI <T: TargetType> {
    
   
    
    func fetchData<M: Codable> (target : T, responseClass : M.Type, completion: @escaping (Result<M?, AFError>)->Void){
        
        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
        let headers = Alamofire.HTTPHeaders(target.headers ?? [:])
        let params = buildPrams(task: target.task)
        let url = target.baseUrl + target.path
       print("URL: \(url)")
        AF.request(url, method: method, parameters:params.0, encoding: params.1, headers: headers).responseDecodable { (response: DataResponse<M, AFError>) in
                        
            switch response.result {
            case .success(let jsonResponseObject):
                completion(.success(jsonResponseObject))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    private func buildPrams(task : Task) -> ([String:Any], ParameterEncoding) {
        switch task {
        
        case .requestPlain:
            return  ([:], URLEncoding.default)
        case .requestParameter(parameters: let parameters, encoding: let encoding):
            return (parameters, encoding )
        }
        
    }
    
}
