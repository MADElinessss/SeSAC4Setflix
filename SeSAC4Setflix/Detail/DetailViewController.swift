//
//  DetailViewController.swift
//  SeSAC4Setflix
//
//  Created by Madeline on 1/31/24.
//

import SnapKit
import UIKit

class DetailViewController: BaseViewController {

    let titleLabel = UILabel()
    
    override func viewDidLoad() { // UIViewController <- 애플거임 super 써야됨!
        super.viewDidLoad()
        
        print("Detaile - viewDidLoad")
        

    }
    
    // 부모 클래스에 있는거 상속받아서 쓰겠다.
    override func configureHierarchy() {
        // 여기서 super 쓰면 BaseViewController에 있는 configureHierarchy 내용도 실행됨
        view.addSubview(titleLabel)
    }
    
    override func configureLayout() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    override func configureView() {
        titleLabel.backgroundColor = .black
        titleLabel.text = "329ㅕ09"
    }
    
    
    

}
