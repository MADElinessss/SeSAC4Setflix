//
//  FindViewController.swift
//  SeSAC4Setflix
//
//  Created by Madeline on 1/31/24.
//

import SnapKit
import UIKit

class FindViewController: UIViewController {
    // 클로저: uisearchbar return -> 장단점이있믐
    // FindViewController 인스턴스 생성(viewDidLoad) 전에 클로저가 먼저 실행됨
    lazy var searchBar: UISearchBar = {
        let view = UISearchBar()
        view.placeholder = "영화를 검색해보세요."
        view.showsCancelButton = true
        view.barStyle = .black
        view.delegate = self
        print("let searchBar")
        return view
    }() // <- 함수 실행하는거
    
    
    
//    lazy var bar = {
//        let view = UISearchBar()
//        view.placeholder = "머식이저쩌고"
//        return view
//    }
//    
//    func makeSearchBar() -> UISearchBar {
//        let view = UISearchBar()
//        view.placeholder = "머식이저쩌고"
//        return view
//    }
    
    
//    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: configureCollectionViewLayout())
    lazy var collectionView : UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: FindViewController.configureCollectionViewLayout())
        view.delegate = self
        view.dataSource = self
        view.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: "SearchCollectionViewCell")
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        configureHierarchy()
        configureLayout()
        configureView()
        
    }
    
    func configureHierarchy() {
        view.addSubview(searchBar)
        view.addSubview(collectionView)
    }
    
    func configureLayout() {
        searchBar.snp.makeConstraints { make in
            make.horizontalEdges.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(44)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func configureView() {
//        searchBar.placeholder = "영화를 검색해보세요."
//        searchBar.showsCancelButton = true
//        searchBar.barStyle = .black
        
        
    }
    
    static func configureCollectionViewLayout() -> UICollectionViewLayout {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.height/3)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        return layout
    }
}

extension FindViewController: UISearchBarDelegate {
    
}

extension FindViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as! SearchCollectionViewCell
        return cell
    }

}

