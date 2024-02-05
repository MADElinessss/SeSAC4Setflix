//
//  TMDBAPIManager.swift
//  SeSAC4Setflix
//
//  Created by Madeline on 1/30/24.
//

import Alamofire
import Foundation

class TMDBAPIManager {
    
    static let shared = TMDBAPIManager()

    func request<T: Decodable>(type: T.Type, api: TMDBAPI, completionHandler: @escaping ((T) -> Void)) {
        
        AF.request(api.endpoint, 
                   method: api.method,
                   parameters: api.parameter,
                   encoding: URLEncoding(destination: .queryString),
                   headers: api.header)
        .responseDecodable(of: T.self) { response in// T.self 자리에 type 써도됨
            switch response.result {
            case .success(let success):
                completionHandler(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func fetchMovie(api: TMDBAPI, completionHandler: @escaping (([Movie]?, AFError?) -> Void)) {
        
        AF.request(api.endpoint,
                   method: api.method,
                   parameters: api.parameter,
                   encoding: URLEncoding(destination: .queryString),
                   headers: api.header)
        .responseDecodable(of: TrendingModel.self) { response in
            switch response.result {
            case .success(let success):
                completionHandler(success.results, nil)
            case .failure(let failure):
                completionHandler(nil, failure)
            }
        }
        
    }
    
    func fetchMovieImages(api: TMDBAPI, completionHandler: @escaping (PosterModel) -> Void) {
        AF.request(api.endpoint,
                   method: api.method,
                   headers: api.header)
        .responseDecodable(of: PosterModel.self) { response in
            switch response.result {
            case .success(let success):
                completionHandler(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
