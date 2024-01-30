//
//  TMDBAPIManager.swift
//  SeSAC4Setflix
//
//  Created by Madeline on 1/30/24.
//

import Alamofire
import Foundation

class TMDBAPIManager {
    
    // 싱글톤 인스턴스 -> shared에만 저장, 더 많은 공간이 다른 곳에서 생기지 않음
    static let shared = TMDBAPIManager()

    func fetchTrendingMovie(completionHandler: @escaping (([Movie]) -> Void)) {
        let url = "https://api.themoviedb.org/3/trending/movie/week?language=ko-KR"
    
        let header: HTTPHeaders = ["Authorization": APIKey.tmdbAPI]
        AF.request(url, method: .get, headers: header).responseDecodable(of: TrendingModel.self) { response in
            switch response.result {
            case .success(let success):
//                print(success)
                completionHandler(success.results)
                // 반환값으로는 값 가져오는거 힘들어. 모든 경우에 대해 return 해야돼
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    // 인스턴스 메서드
    func fetchMovieImages() {
        
        
        
    }
    
    
    
}
