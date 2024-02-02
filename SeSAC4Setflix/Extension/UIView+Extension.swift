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

enum TransitionStyle {
    case present
    case presentNavigation // 네비게이션 임베드 present
    case presentFullNavigation // 네비게이션 임베드 full present
    case push
}



extension UIViewController {
//    func transition<T: UIViewController>(style: TransitionStyle, storyboard: String, viewController: String) {
    func transition<T: UIViewController>(style: TransitionStyle, storyboard: String, viewController: T.Type) {
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
//        let vc = storyboard.instantiateViewController(identifier: String(describing: viewController)) as! T
        // 왜 T? 이 자리에는 인스턴스가 아니라 클래스 자체가 들어옴
        // 원래 저 자리에 MainViewController()가 아니라, MainViewController <- 클래스 자체가 들어오니까
        
        // 제네릭은 타입을 유연하게 대응하기 위함이야.
        
        //  T.Type <- 메타타입!
        
        /*
         메타타입? 가보자
         제네릭은 2개가 있어.
         Array <- 공식문서나 definition보면 Generic 타입이야.
         Array도 숫자가 들어올지, 문자가 들어올지 몰라. 타입 명세하긴 하는데, 걍 Element임
         그래서 원래는 array를
         let array : [String] = ["1", "2"]
         let array: Array<String> = ["1", "2"] 요렇게 써야돼
         
         */
//        let vc = storyboard.instantiateViewController(identifier: String(describing: viewController)) as! SearchViewController
        
        let a: SearchViewController = SearchViewController()
        let b: SearchViewController.Type = SearchViewController.self
        let vc = storyboard.instantiateViewController(identifier: String(describing: viewController)) as! T
        // as! b <- 얘도 문법적으로는 맞는데 실제로 사용될때엔 T, T.self가 다르게 쓰임
        
        
        // 화면 전환하는 방법
        switch style {
        case .present:
            present(vc, animated: true)
        case .presentNavigation:
            let nav = UINavigationController(rootViewController: vc)
            present(nav, animated: true)
        case .presentFullNavigation:
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: true)
        case .push:
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
