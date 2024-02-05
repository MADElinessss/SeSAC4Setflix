//
//  FindViewController.swift
//  SeSAC4Setflix
//
//  Created by Madeline on 1/31/24.
//

import Kingfisher
import SnapKit
import UIKit

class FindViewController: UIViewController {
    
    let mainView = FindView()
    
    var list: [Movie] = []
    
    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.searchBar.delegate = self
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        
//        TMDBSessionManager.shared.fetchTrendingMovie()
        print("1111111111", Thread.isMainThread)
        TMDBSessionManager.shared.fetchTrendingMovie { movie, error in
            print("2222222222", Thread.isMainThread)
            if error == nil {
                // 네트워크 통신 성공
                guard let movie = movie else { return }
                
                self.list = movie.results
                print("555555555", Thread.isMainThread)
                self.mainView.collectionView.reloadData()
                
            } else {
                // error 분기처리
                // alert
                
            }
        }
    }
}

extension FindViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        TMDBAPIManager.shared.fetchMovie(api: .search(query: searchBar.text ?? "")) { movie in
//            self.list = movie
//            self.mainView.collectionView.reloadData()
//        }
        
//        TMDBAPIManager.shared.searchMovie(query: searchBar.text!) { movie in
//            self.list = movie
//            self.mainView.collectionView.reloadData()
//        }
        
        
    }
}

extension FindViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as! SearchCollectionViewCell
        
        
        if let poster = list[indexPath.item].posterPath {
            let url = URL(string: "https://image.tmdb.org/t/p/w300/\(poster)")
            cell.posterImageView.kf.setImage(with: url)
        } else {
            cell.posterImageView.image = UIImage(systemName: "star")
        }
        
        cell.titleLabel.text = list[indexPath.item].title
        
        return cell
    }
}

