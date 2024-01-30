//
//  BlackTextLabel.swift
//  SeSAC4Setflix
//
//  Created by Madeline on 1/29/24.
//

import Foundation
import UIKit

class BlackTextLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    func configureView() {
        // self 생략 가능
        self.font = .boldSystemFont(ofSize: 20)
        self.textAlignment = .left
        self.numberOfLines = 0
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
