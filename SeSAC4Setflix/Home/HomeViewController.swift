//
//  HomeViewController.swift
//  SeSAC4Setflix
//
//  Created by Madeline on 1/29/24.
//

import SnapKit
import UIKit

class HomeViewController: UIViewController {
    
    let mainView = HomeView()
    
    override func loadView() {
        // rootView를 만들어줌
        // rootView -> 커스텀 뷰로 교체: Label, Button, layout, .. -> ViewController가 아니라, UIView가 책임지게 설정
        self.view = mainView
        // super 메소드를 호출하지 않는다!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        mainView.signButton.addTarget(self, action: #selector(signButtonTapped), for: .touchUpInside)
        
    }
    
    @objc func signButtonTapped() {
        present(FindViewController(), animated: true)
    }
}
