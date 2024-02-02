//
//  UIView+Extension.swift
//  SeSAC4Setflix
//
//  Created by Madeline on 2/2/24.
//

import UIKit

extension UIViewController {
    // 타입별로 메서드 만들어야됨
//    func plus(a: Int, b: Int) -> Int {
//        return a+b
//    }
//    func plus(a: Double, b: Double) -> Double {
//        return a+b
//    }
//    func plus(a: Float, b: Float) -> Float {
//        return a+b
//    }
    // Int, Double, Float에 대한 자리를, 타입을 잘 품으면 해결할 수 있지 않을까?
    
    // MARK: Swift Generic
    // 타입에 유연하게 대응하기 위함
    // 같은 타입인지!만 명세함
    // 호출할 때 구체적인 타입을 정의함
    
//    func plus(a: ???, b: ???) -> ??? {
//        return a+b
//    }
//    func plus<T>(a: T, b: T) -> T {
//        return a
//    }
    // T: 타입 파라미터(placeholder와 같은 역할) U도 가끔 씀
    // T 자리엔 다 같은 타입이 나와야됨
    // 근데 a+b는 에러나 왜냐면 뭐가 들어올지 모르는데, +가 안되는 타입도 있으니까
    // => 제약 설정하면 됨
    // T긴 T인데, 특정 그룹에 속하는 애들만 들어올 수 있게 제약! 클래스 제약, 프로토콜 제약이 있음
    // Numeric: 공식문서 찾아보기! 프로토콜로 구현돼있음, Conforming Types
    // 그러면 뭐가 들어올지는 모르겠지만 Numeric 프로토콜을 채택하는 애가 들어올거야! <- 이러면 이제 string, bool은 못들어가
    
    func plus<T: Numeric>(a: T, b: T) -> T {
        return a + b
    }
}

// 만약에 모서리, 테두리같은거 extension으로 뺀다면,
extension UILabel {
    func setBorder() {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
    }
}
extension UIButton {
    func setBorder() {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
    }
}
// UIView에 들어있는 모든 요소에 대해서 setBorder를 하고 싶어! => 제네릭 구조로 확대
extension UIViewController {
    func setBorder<T: UIView>(a: T) {// UIView 상속받는 애들만 들어오면 좋게써 int, string이런건 말고
        a.layer.borderWidth = 1
        a.layer.borderColor = UIColor.black.cgColor
    }
}


