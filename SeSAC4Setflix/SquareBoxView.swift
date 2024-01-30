//
//  SquareBoxView.swift
//  SeSAC4Setflix
//
//  Created by Madeline on 1/29/24.
//

import UIKit

@IBDesignable
class SquareBoxView: UIView {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: 스토리보드 기반으로 작업했을 때 실행
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        loadView()
        loadUI()
        
    }
    
    // MARK: 연산 프로퍼티 복습,,
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return posterImageView.layer.cornerRadius
        }
        set {
            posterImageView.layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor {
        get {
            return UIColor(cgColor:  posterImageView.layer.borderColor!)
        }
        set {
            posterImageView.layer.borderColor = newValue.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return posterImageView.layer.borderWidth
        }
        set {
            posterImageView.layer.borderWidth = newValue
        }
    }
    
    func loadView() {
        let view = UINib(nibName: "SquareBoxView", bundle: nil).instantiate(withOwner: self).first as! UIView
        // 인스턴스화해서 사용: .instantiate(withOwner: self)
        
        view.frame = bounds
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 10
        self.addSubview(view)
    }
    
    func loadUI() {
        titleLabel.font = .boldSystemFont(ofSize: 16)
        titleLabel.textAlignment = .center
        posterImageView.image = UIImage(systemName: "star.fill")
        posterImageView.backgroundColor = .green
    }
}
