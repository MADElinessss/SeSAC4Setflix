//
//  HomeViewController.swift
//  SeSAC4Setflix
//
//  Created by Madeline on 1/29/24.
//

import SnapKit
import UIKit

class HomeViewController: UIViewController {
    
    let emailTextField = BlackRadiusTextField()
    let passwordTextField = BlackRadiusTextField()
    let titleLabel = BlackTextLabel()
    let logoImageView = PosterImageView(frame: .zero)
    // .zero: CGRect(x:0, y:0, width:0, height:0)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    func configureHierarchy() {
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(titleLabel)
        view.addSubview(logoImageView)
    }
    
    func configureView() {
        emailTextField.placeholder = "이메일을 입력해주세요."
        passwordTextField.placeholder = "비밀번호를 입력해주세요."
        titleLabel.text = "로그인"
        logoImageView.image = UIImage(systemName: "person")
    }
    
    func configureLayout() {
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.centerX.equalTo(view)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(24)
            make.height.width.equalTo(100)
            make.centerX.equalTo(view)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.height.equalTo(44)
            make.center.equalTo(view.safeAreaLayoutGuide)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.height.equalTo(44)
            make.top.equalTo(emailTextField.snp.bottom).offset(24)
        }
    }
}

#Preview {
    HomeViewController()
}
