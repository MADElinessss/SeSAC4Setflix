//
//  TMDBAPI.swift
//  SeSAC4Setflix
//
//  Created by Madeline on 2/1/24.
//

import Alamofire
import Foundation

enum TMDBAPI {
    
    // 요청할 URL의 종류
    case trending
    case search(query: String)
    case photo(id: String) // 함수의 매개변수처럼 사용
    
    var baseURL: String {
        return "https://api.themoviedb.org/3/"
    }
    
    var endpoint: URL {
        switch self {
        case .trending:
            return URL(string: baseURL + "trending/movie/week")!
        case .search:
            return URL(string: baseURL + "search/movie")!
        case .photo(let id):
            return URL(string: baseURL + "movie/\(id)/images")! // movie/\(id)/images <- id: String
        }
    }
    
    var header: HTTPHeaders {
        return ["Authorization": APIKey.tmdbAPI]
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var parameter: Parameters {
        switch self {
        case .trending:
            ["":""]
        case .search(let query):
            ["language": "ko-KR", "query": query] // query: 검색어 <- query: String
        case .photo:
            ["":""]
        }
    }
}
