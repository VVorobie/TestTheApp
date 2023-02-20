//
//  NewsTableViewCell.swift
//  TestTheApp
//
//  Created by Владимир Воробьев on 17.02.2023.
//

import UIKit
/// Ячейка для таблицы экрана Новости
final class NewsTableViewCell: UITableViewCell {
    // вью ячейки
    private lazy var newsCellView = NewsCellView()
    //Конфигурация вью в соответствии с вью-моделью
    func config(with model: NewsViewModel) {
        newsCellView.config(with: model)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupConstraints()
    }

    private func setupConstraints () {
        contentView.addSubview(newsCellView)
        
        NSLayoutConstraint.activate([
            newsCellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            newsCellView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            newsCellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            newsCellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
}
