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

    func fetchMovie(api: TMDBAPI, completionHandler: @escaping (([Movie]) -> Void)) {
        
        AF.request(api.endpoint, 
                   method: api.method,
                   parameters: api.parameter,
                   encoding: URLEncoding(destination: .queryString),
                   headers: api.header)
        .responseDecodable(of: TrendingModel.self) { response in
            switch response.result {
            case .success(let success):
                completionHandler(success.results)
            case .failure(let failure):
                print(failure)
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
