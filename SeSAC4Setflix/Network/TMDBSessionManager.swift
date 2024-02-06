//
//  TMDBSessionManager.swift
//  SeSAC4Setflix
//
//  Created by Madeline on 2/5/24.
//

import Foundation

enum TMDBError: Error {
    case failedRequest
    case noData
    case invalidResponse
    case invalidData
}

class TMDBSessionManager {
    static let shared = TMDBSessionManager()
    
    private init() { }
    
//    /
//     MARK: URLSession
//     1. URLSessionConfiguration
//     - shared, default, ephemeral, ...
//     2. URLSessionTask
//     - datatask(대부분), download, upload, stream, ...
//     3. URLResponse
//     - completionHandler, delegate(진행률)
//     */
//    
    func fetchTrendingMovie(completionHandler: @escaping (TrendingModel?, TMDBError?) -> Void) {

        var url = URLRequest(url: TMDBAPI.trending.endpoint)
        url.addValue(APIKey.tmdbAPI, forHTTPHeaderField: "Authorization")
        print("33333333", Thread.isMainThread)
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            DispatchQueue.main.async {
                
    //            print("DATA: ", data)
    //            print("RESPONSE: ", response)
    //            print("ERROR: ", error)
                print("44444444444", Thread.isMainThread)
                guard error == nil else {
                    // 네트워크 통신 실패
                    // 여기에서도 알럿, 토스트 보낼 수 업슴
                    // 뭐해줘야되나? completionHandler로 바깥으로 꺼내조
                    completionHandler(nil, .failedRequest) // case별로 호출
                    return
                }
                // 네트워크 통신 성공
                guard let data = data else {// 실데이터, 에러코
                    // 근데 데이터가 없음
                    completionHandler(nil, .noData)
                    return
                }
                
    //            print(String(data: data, encoding: .utf8))
                
                guard let response = response as? HTTPURLResponse else {
                    // 근데 응답(ex.상태코드)가 없음
                    completionHandler(nil, .invalidResponse)
                    return
                }
                guard response.statusCode == 200 else {
                    // 상태코드가 200이 아님, 올바른 값이 오지 않은 상태
                    completionHandler(nil, .failedRequest)
                    return
                }
                
                // 옵셔널 꺼낸 data를 우리가 만든 모델로 저장하면 됨
                do {
                    let result = try JSONDecoder().decode(TrendingModel.self, from: data)
                    completionHandler(result, nil)
                } catch {
                    // 네트워크 통신은 성공인데, 내가 만든 모델에 안들어갔을 경우의 에러임
                    completionHandler(nil, .invalidData)
                }
            }
            
            
        }.resume()
    }
}

