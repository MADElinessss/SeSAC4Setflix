//
//  SearchTableViewCell.swift
//  SeSAC4Setflix
//
//  Created by Madeline on 1/30/24.
//

import Kingfisher
import SnapKit
import UIKit

// MARK: 얘 안에 CollectionView 넣어보자! 세로 스크롤(테이블뷰) + 가로 스크롤(컬렉션뷰)
class SearchTableViewCell: UITableViewCell {
    
    var list : [Movie] = []

    let titleLabel = BlackTextLabel()
    let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: configureCollectionViewLayout()
    )
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureHierarchy()
        configureLayout()
        configureView()
        
//        TMDBAPIManager.shared.fetchTrendingMovie { movie in
//            self.list = movie
//            self.collectionView.reloadData()
//            // MARK: 테이블뷰 다 나오게 다시 그리기
////            self.tableView.reloadData()
//        }
    }
    
    func configureHierarchy() {
        contentView.addSubview(collectionView)
        contentView.addSubview(titleLabel)
    }
    
    func configureLayout() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide).inset(16)
            make.height.equalTo(16)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(contentView.safeAreaLayoutGuide)
            make.height.equalTo(200)
        }
    }
    
    func configureView() {
        
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        collectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: "SearchCollectionViewCell")
        
        collectionView.backgroundColor = .red
        collectionView.isPagingEnabled = true
        
        backgroundColor = .orange
        
        titleLabel.text = "☃️☃️☃️☃️☃️☃️☃️☃️"
        titleLabel.textColor = .white
        titleLabel.font = .boldSystemFont(ofSize: 16)
        titleLabel.backgroundColor = .blue
    }
    
    static func configureCollectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        // MARK: 가로 스크롤 - width device에 맞추고
        layout.itemSize = CGSize(width: 120, height: 160)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        // MARK: 가로 스크롤 방향
        layout.scrollDirection = .horizontal
        
        return layout
    }
    
    // 프로토콜 안에 있는 애라서 꼭 적어라~
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//extension SearchTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return list.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as! SearchCollectionViewCell
//        
//        let url = URL(string: "https://image.tmdb.org/t/p/w300/\(list[indexPath.item].posterPath)")
//        cell.posterImageView.kf.setImage(with: url)
//        cell.titleLabel.text = list[indexPath.item].title
//        
//        
//        return cell
//    }
//}
