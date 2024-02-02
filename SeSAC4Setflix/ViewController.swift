//
//  ViewController.swift
//  SeSAC4Setflix
//
//  Created by Madeline on 1/29/24.
//

import UIKit

class ViewController: UIViewController {

    
    
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
    }


}

