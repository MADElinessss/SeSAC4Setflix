//
//  FindView.swift
//  SeSAC4Setflix
//
//  Created by Madeline on 2/1/24.
//

import SnapKit
import UIKit

class FindView: BaseView {

    let searchBar: UISearchBar = {
        let view = UISearchBar()
        view.placeholder = "영화를 검색해보세요."
        view.showsCancelButton = true
        view.barStyle = .black
        
        return view
    }()
    
    let collectionView : UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: FindView.configureCollectionViewLayout())
        view.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: "SearchCollectionViewCell")
        return view
    }()
    
    override func configureHierarchy() {
        self.addSubview(searchBar)
        self.addSubview(collectionView)
    }
    
    override func configureLayout() {
        searchBar.snp.makeConstraints { make in
            make.horizontalEdges.top.equalTo(self.safeAreaLayoutGuide)
            make.height.equalTo(44)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.horizontalEdges.bottom.equalTo(self.safeAreaLayoutGuide)
        }
    }
    
    static func configureCollectionViewLayout() -> UICollectionViewLayout {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.height/3)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        return layout
    }
}
