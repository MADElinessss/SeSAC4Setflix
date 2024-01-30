//
//  SearchViewController.swift
//  SeSAC4Setflix
//
//  Created by Madeline on 1/29/24.
//

import Kingfisher
import SnapKit
import UIKit

/*
 나머지는 내일!
 커스텀 뷰 재사용성 높이는 방법
 */

class SearchViewController: UIViewController {
    
    // MARK: 임의 배열
//    let list = ["star", "pencil", "person", "star.fill", "xmark"]
    var list : [Movie] = [] // <- ☀️ 상단 컬렉션뷰에서 사용할 리스트
    
    var titleList: [String] = ["포스터", "웡카", "위시", "아쿠아맨"] // <- 하단 테이블뷰 셀의 컬렉션뷰에서 사용할 리스트
    
    // 313369, 11036, 122906, 11324, 19995
    // 1. imageList -> TableView -> CollectionView
    // 2. 네트워크 요청 -> 응답 받아 -> imageList에 담아 -> reload
//    var imageList: [[String]] = [
//        ["humidity", "rainbow", "wind", "snowflake"],
//        ["mic.fill", "sun.max", "sunset", "cloud.rain"],
//        ["gamecontroller"],
//        ["figure.walk", "moon.fill"]
//    ]
    
    var imageList: [PosterModel] = [
        PosterModel(posters: []),
        PosterModel(posters: []),
        PosterModel(posters: []),
        PosterModel(posters: [])
    ]

    // configureCollectionViewLayout가 만들어져야 -> collectionView 속성을 잡음
    // 시점 조절해야 함
    // 인스턴스 프로퍼티 -> 나중에 만들어!
    // 🚨 1. lazy var collectionView = UICollectionView(
    let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: configureCollectionViewLayout()
    )
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
        configureLayout()
        configuewView()
        
        TMDBAPIManager.shared.fetchTrendingMovie { movie in
            self.list = movie
            self.collectionView.reloadData()
            // MARK: 테이블뷰 다 나오게 다시 그리기
//            self.tableView.reloadData()
        }
        
        TMDBAPIManager.shared.fetchMovieImages(313369) { poster in
            self.imageList[0] = poster
            self.tableView.reloadData()
        }
        
        TMDBAPIManager.shared.fetchMovieImages(11036) { poster in
            self.imageList[1] = poster
            self.tableView.reloadData()
        }
        
        TMDBAPIManager.shared.fetchMovieImages(122906) { poster in
            self.imageList[2] = poster
            self.tableView.reloadData()
        }
        
        TMDBAPIManager.shared.fetchMovieImages(19995) { poster in
            self.imageList[3] = poster
            self.tableView.reloadData()
        }
    }
    
    func configureHierarchy() {
        view.addSubview(collectionView)
        view.addSubview(tableView)
    }
    
    func configureLayout() {
        collectionView.snp.makeConstraints { make in
            make.horizontalEdges.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(200)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom)
            make.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func configuewView() {
        
        // MARK: - CollectionView
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: "SearchCollectionViewCell")
        
        collectionView.backgroundColor = .orange
        
        // 가로스크롤 - 페이지별로 딱 멈추게
        collectionView.isPagingEnabled = true // cell사이즈 상관없이 device 너비만큼 움직임
        // -> 그래서 spacing 없을때 적합함
        
        // MARK: - TableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 200
        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: "SearchTableViewCell")
    }
    
    // 인스턴스 메서드
    // 🚨 2. static으로 만들어!  🚨🚨🚨🚨🚨🚨🚨🚨
    static func configureCollectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        // MARK: 가로 스크롤 - width device에 맞추고
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 200)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        // MARK: 가로 스크롤 방향
        layout.scrollDirection = .horizontal
        
        return layout
    }
}

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // self.collectionView: 가까운 놈
        if self.collectionView == collectionView {
            return list.count
        } else {
            return imageList[collectionView.tag].posters.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as! SearchCollectionViewCell
        
        if self.collectionView == collectionView {
            let url = URL(string: "https://image.tmdb.org/t/p/w300/\(list[indexPath.item].posterPath)")
            cell.posterImageView.kf.setImage(with: url)
            cell.titleLabel.text = list[indexPath.item].title
        } else {
            let item = imageList[collectionView.tag].posters[indexPath.item]
            let url = URL(string: "https://image.tmdb.org/t/p/w300/\(item.file_path)")
            cell.posterImageView.kf.setImage(with: url)
//            cell.titleLabel.text = list[indexPath.item].title)
//            cell.titleLabel.text = "🙈🙈🙈🙈"
        }
        
        return cell
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return titleList.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        
        cell.collectionView.delegate = self
        cell.collectionView.dataSource = self
        cell.collectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: "SearchCollectionViewCell")
        
        cell.collectionView.tag = indexPath.row
        cell.titleLabel.text = titleList[indexPath.row]
        
        // MARK: 테이블뷰 다 나오게 다시 그리기
        cell.collectionView.reloadData()
        
        return cell
    }
}

#Preview {
    SearchViewController()
}
