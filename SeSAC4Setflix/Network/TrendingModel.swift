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
// 서버에서는 값이 nil로 오는데, 클라이언트 모델에서는 옵셔널이 아닌 모델로 구성할 수는 없을까?
struct Movie: Decodable {
    let id: Int
    let title: String
    let originalTitle: String
    let overview: String?
    let posterPath: String?
    let backdropPath: String?
//    let top10: String?//<-서버에서 오진 않는데, 내가 만들고 싶어
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
    }
    /*
     - 서버에서 받은 값을 그대로 사용하지 않고, 일부 제약조건을 추가하거나 값에 대한 변형을 하고 싶을 때 사용함
     - 서버에서 null을 줄 때, 대체할 문자열을 추가하고 싶을 때
     */
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.id = try container.decode(Int.self, forKey: .id)
//        self.title = try container.decode(String.self, forKey: .title)
//        self.originalTitle = try container.decode(String.self, forKey: .originalTitle)
//        self.overview = try container.decodeIfPresent(String.self, forKey: .overview) ?? "아직 줄거리가 준비되지 않았어요!"
//        self.posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath) ?? ""
//        self.backdropPath = try container.decodeIfPresent(String.self, forKey: .backdropPath) ?? ""
////        self.top10 = title.contains("최고") ? "TOP10영화" : ""
//    }
}
