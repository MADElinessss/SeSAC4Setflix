//
//  HomeView.swift
//  SeSAC4Setflix
//
//  Created by Madeline on 2/1/24.
//

import SnapKit
import UIKit

class HomeView: BaseView {
    
    let emailTextField : BlackRadiusTextField = {
       let view = BlackRadiusTextField()
        view.placeholder = "이메일을 입력해주세요."
        return view
    }()
    
    let passwordTextField = BlackRadiusTextField()
    let titleLabel = BlackTextLabel()
    let logoImageView = PosterImageView(frame: .zero)
    
    let signButton: UIButton = {
        let view = UIButton()
        view.setTitle("버튼", for: .normal)
        view.backgroundColor = .orange
        view.setTitleColor(.white, for: .normal)
        return view
    }()
    
    override func configureHierarchy() {
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(titleLabel)
        addSubview(logoImageView)
        addSubview(signButton)
    }
    
    override func configureView() {
        emailTextField.placeholder = "이메일을 입력해주세요."
        passwordTextField.placeholder = "비밀번호를 입력해주세요."
        titleLabel.text = "로그인"
        logoImageView.image = UIImage(systemName: "person")
    }
    
    override func configureLayout() {
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.centerX.equalTo(self)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(24)
            make.height.width.equalTo(100)
            make.centerX.equalTo(self)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(24)
            make.height.equalTo(44)
            make.center.equalTo(safeAreaLayoutGuide)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(24)
            make.height.equalTo(44)
            make.top.equalTo(emailTextField.snp.bottom).offset(24)
        }
        
        signButton.snp.makeConstraints { make in
            make.bottom.horizontalEdges.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(50)
        }
    }
    
}
