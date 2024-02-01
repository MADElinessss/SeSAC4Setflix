//
//  BaseViewController.swift
//  SeSAC4Setflix
//
//  Created by Madeline on 1/31/24.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print(self, #function)
        
        
        // 이 뷰컨을 상속받는 모든 뷰에 해당될 속성들
        view.backgroundColor = .white
        
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    func configureHierarchy() {
        print(self, #function)
    }
    
    func configureLayout() {
        print(self, #function)
    }
    
    func configureView() {
        print(self, #function)
    }
}

// 사용:
/*
 class DetailViewController: BaseViewController {
*/
