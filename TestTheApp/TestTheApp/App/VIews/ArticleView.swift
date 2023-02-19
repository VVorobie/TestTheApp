//
//  ArticleView.swift
//  TestTheApp
//
//  Created by Владимир Воробьев on 19.02.2023.
//

import UIKit

final class ArticleView: UIView {

    private lazy var picture: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 22
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var favoritePicture: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.sfProNormal.withSize(13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.sfProSemi.withSize(16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var contentTextView: UITextView = {
        let text = UITextView()
        text.font = Fonts.sfProNormal.withSize(13)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
      
    convenience init(model: NewsViewModel) {
        self.init(frame: .zero)
        setupView()
        config(with: model)
    }
    
    func config (with model: NewsViewModel) {
        picture.image = UIImage(named: model.imageName)
        if model.favorite { favoritePicture.image = UIImage(named: "Избранное") }
        else { favoritePicture.image = UIImage(named: "Неизбранное") }
        dateLabel.text = model.date
        titleLabel.text = model.title
        contentTextView.text = model.content
    }
    
    // MARK: - Subviews Setup
    
    private func setupView() {
        backgroundColor = .white //#FFFFFF
        clipsToBounds = true
                
        setupConstraints ()
    }
    
    private func setupConstraints () {
        addSubview(picture)
        addSubview(dateLabel)
        addSubview(favoritePicture)
        addSubview(titleLabel)
        addSubview(contentTextView)
        
        NSLayoutConstraint.activate([
            picture.leadingAnchor.constraint(equalTo: centerXAnchor, constant:  -375 / 2),
            picture.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            picture.widthAnchor.constraint(equalToConstant: 375),
            picture.heightAnchor.constraint(equalToConstant: 260),

            dateLabel.leadingAnchor.constraint(equalTo: picture.leadingAnchor, constant: 15),
            dateLabel.topAnchor.constraint(equalTo: picture.bottomAnchor, constant: 15),
//            dateLabel.widthAnchor.constraint(equalToConstant: 72),
            dateLabel.heightAnchor.constraint(equalToConstant: 18),

            favoritePicture.trailingAnchor.constraint(equalTo: picture.trailingAnchor, constant: -23),
            favoritePicture.topAnchor.constraint(equalTo: picture.bottomAnchor, constant: 14),
            favoritePicture.widthAnchor.constraint(equalToConstant: 22),
            favoritePicture.heightAnchor.constraint(equalToConstant: 20.32),

            titleLabel.leadingAnchor.constraint(equalTo: picture.leadingAnchor, constant: 15),
            titleLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 11),
            titleLabel.widthAnchor.constraint(equalToConstant: 310),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),

            contentTextView.leadingAnchor.constraint(equalTo: picture.leadingAnchor, constant: 15),
            contentTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            contentTextView.widthAnchor.constraint(equalToConstant: 346),
            contentTextView.heightAnchor.constraint(equalToConstant: 324)
        ])
    }
}
