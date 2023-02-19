//
//  FavoritesCollectionViewCell.swift
//  TestTheApp
//
//  Created by Владимир Воробьев on 19.02.2023.
//

import UIKit

final class FavoritesCollectionViewCell: UICollectionViewCell {
    
    private lazy var favoritesCellView = FavoritesCellView()
    
    func config(with model: NewsViewModel) {
        favoritesCellView.config(with: model)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupConstraints()
    }


    private func setupConstraints () {
        contentView.addSubview(favoritesCellView)
        
        NSLayoutConstraint.activate([
            favoritesCellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            favoritesCellView.topAnchor.constraint(equalTo: contentView.topAnchor),
            favoritesCellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            favoritesCellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            favoritesCellView.widthAnchor.constraint(equalToConstant: 164),
            favoritesCellView.heightAnchor.constraint(equalToConstant: 191)
        ])
    }
    
}
