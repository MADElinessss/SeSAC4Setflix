//
//  PosterModel.swift
//  SeSAC4Setflix
//
//  Created by Madeline on 1/30/24.
//

import Foundation

struct PosterModel: Decodable {
    let posters: [Posters]
}
struct Posters: Decodable {
    let file_path: String
}
