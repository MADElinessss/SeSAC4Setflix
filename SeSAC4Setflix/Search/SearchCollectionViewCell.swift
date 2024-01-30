//
//  SearchCollectionViewCell.swift
//  SeSAC4Setflix
//
//  Created by Madeline on 1/30/24.
//

import SnapKit
import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    
    let posterImageView = PosterImageView(frame: .zero)
    let titleLabel = BlackTextLabel()
    
    // 코드로 초기화
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // MARK: 순서도 중요함
        configureHierarchy()
        configureLayout()
        configureView()
        
    }

    func configureHierarchy() {
        contentView.addSubview(posterImageView)
        contentView.addSubview(titleLabel)
    }
    
    func configureLayout() {
        posterImageView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalTo(contentView)
            make.height.equalTo(44)
        }
    }
    
    func configureView() {
        posterImageView.image = UIImage(systemName: "person")
        titleLabel.text = "example"
    }
    
    // 스토리보드로 초기화
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
