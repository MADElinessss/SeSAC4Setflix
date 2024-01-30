//
//  BlackRadiusTextField.swift
//  SeSAC4Setflix
//
//  Created by Madeline on 1/29/24.
//

import UIKit

@IBDesignable
class BlackRadiusTextField: UITextField {
    // MARK: 코드로 작업했을 때 초기화하는 법
    override init(frame: CGRect) { // 클래스에서 온 것
        super.init(frame: frame)
        
        configureView()
        print("textField override init")
        
    }
    
    // MARK: 연산 프로퍼티 복습,,
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    func configureView() {
        backgroundColor = .clear
        textAlignment = .center
        borderStyle = .none
        layer.cornerRadius = 8
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth =  1
    }
    
    // 스토리보드로 작업했을 때의 init
    required init?(coder: NSCoder) { // 프로토콜에서 온 것
        super.init(coder: coder)
        print("textField required init")
//        fatalError("init(coder:) has not been implemented")
        // fatal Error: 디버깅 용도! 런타임 이슈로 해결하고 싶은 문제에만
        // assert: 비슷한 애
        configureView()
    }
}














//
//protocol Example {
//    func example()
//    // init도 프로토콜로 만들 수 있음 -> 얘를 채택하면 무족건 init 해라
//    init()
//}
//
//class Apple: Mobile {
//    
//    // Example 채택
////    let name: String
////    init(name: String) {
////        self.name = name
////    }
////    
////    func example() {
////        <#code#>
////    }
////    
////    required init() {
////        <#code#>
////    }
//    // Mobile 상속
//    required override init() {
//        
//    }
//    
//    override init(name: String) {
//        <#code#>
//    }
//    
//}
//
//class Mobile: Example {
//    // required가 붙어있는 init: protocol에서 온 init임
//    required init() {
//        <#code#>
//    }
//    
//    func example() {
//        <#code#>
//    }
//    
//    let name: String
//    
//    init(name: String) {
//        self.name = name
//    }
//}
