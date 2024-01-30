//
//  Trending.swift
//  SeSAC4Setflix
//
//  Created by Madeline on 1/30/24.
//

import Foundation
// Decodable: 외부 값 -> 내부 값
struct TrendingModel: Decodable {
    
    let page: Int
    let results: [Movie]
    
}

struct Movie: Decodable {
    
    let id: Int
    let title: String
    let originalTitle: String
    let overview: String
    let posterPath: String
    let backdropPath: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
    }
    
}
