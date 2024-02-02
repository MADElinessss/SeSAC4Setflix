//
//  ViewController.swift
//  SeSAC4Setflix
//
//  Created by Madeline on 1/29/24.
//

import UIKit

class ViewController: UIViewController {

    struct User {
        static let id = 123 // 타입 프로퍼티
        let nickname: String // 인스턴스 프로퍼티
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: Generic
        let c = plus(a: 1, b: 2) // c: Int
        let d = plus(a: 1.0, b: 2.0) // d: Double
//        let e = plus(a: "1", b: "2") // e: String
//        let f = plus(a: true, b: false) // f: Bool
        
        let title = UILabel()
        let button = UIButton()
        setBorder(a: title)
        setBorder(a: button)
        
        // MARK: 메타 타입
        let name = "고래밥"// String 타입의 인스턴스를 저장
        let age: Int = 23// Int 타입의 인스턴스를 저장
        let user = User(nickname: "Madeline")
        // user: 타입 = User, User타입의 인스턴스(실제값)을 저장
        
        // 타입 그 자체를 저장할 수 있나? Int, String, User 타입 자체를!
        print(name, age, user) // 고래밥 23 User(nickname: "Madeline")
        print(type(of: name)) // String
        
        print(type(of: String.self), type(of: Int.self), type(of: User.self)) // String.Type Int.Type User.Type <- 메타 타입
        // 타입의 타입임.
        // String.Type -> String.self -> String -> "고래밥"
        // User 구조체의 nick을 쓸 때
        // 원래는 User.self.nickname임, User.self <- 타입을 사용한다는 뜻
        let meta: User.Type = User.self // <- 요런식
        
        let metaName = String.self //타입 자체를 넣는다
        
        
        TMDBAPIManager.shared.request(
            type: PosterModel.self,
            api: .photo(id: "518068")) { poster in
            print(poster)
        }
        
        TMDBAPIManager.shared.request(
            type: TrendingModel.self,
            api: .search(query: "apple")) { search in
            print(search)
        }
        
        TMDBAPIManager.shared.request(
            type: TrendingModel.self,
            api: .trending) { trending in
            print(trending)
        }
        
    }
}

