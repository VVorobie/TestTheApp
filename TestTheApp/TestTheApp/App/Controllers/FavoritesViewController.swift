//
//  FavoritesViewController.swift
//  TestTheApp
//
//  Created by Владимир Воробьев on 17.02.2023.
//

import UIKit

class FavoritesViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var favoritesLabel: UILabel!
    
    var models: [NewsViewModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        models = NewsData.models
        collectionView.allowsSelection = true
    }
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension FavoritesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let models = models {
            return models.count
        } else { return 0 }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoritesCollectionViewCell", for: indexPath)
        if let favoriteCell = cell as? FavoritesCollectionViewCell {
            if let models = models {
                favoriteCell.config(with: models[indexPath.row])
            }
            return favoriteCell
        } else {
            return cell
        }
    }
}

extension FavoritesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = ArticleViewController()
        vc.model = models?[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
        navigationController?.isNavigationBarHidden = false
    }
}
