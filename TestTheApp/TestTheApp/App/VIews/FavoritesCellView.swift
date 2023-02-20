//
//  FavoritesCellView.swift
//  TestTheApp
//
//  Created by Владимир Воробьев on 19.02.2023.
//

import UIKit
/// Класс изображения для ячейки таблицы Избранное
final class FavoritesCellView: UIView {
    // Фото
    private lazy var picture: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 22
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    // Полотно, закрывающее нижнюю часть фото
    private lazy var coveringView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    // Картинка сердечка избранное
    private lazy var favoritePicture: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    // Надпись даты
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.sfProNormal.withSize(13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    //Надпись заголовка
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.sfProSemi.withSize(16)
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Инициализаторы
    // Переписанный инициализатор для установки суб изображений
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    // MARK: - Subviews Setup
    // Конфигурация в соответствии с моделью
    func config (with model: NewsViewModel) {
        picture.image = UIImage(named: model.imageName)
        if model.favorite { favoritePicture.image = UIImage(named: "Избранное") }
        else { favoritePicture.image = UIImage(named: "Неизбранное") }
        dateLabel.text = model.date
        titleLabel.text = model.title
    }
   
    private func setupView() {
        backgroundColor = .white //#FFFFFF
        layer.cornerRadius = 22
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
                
        setupConstraints ()
    }
    
    private func setupConstraints () {
        addSubview(picture)
        addSubview(coveringView)
        addSubview(dateLabel)
        addSubview(favoritePicture)
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            picture.leadingAnchor.constraint(equalTo: leadingAnchor),
            picture.topAnchor.constraint(equalTo: topAnchor),
            picture.trailingAnchor.constraint(equalTo: trailingAnchor),
            picture.heightAnchor.constraint(equalTo: picture.widthAnchor, multiplier: 260 / 375),

            coveringView.leadingAnchor.constraint(equalTo: leadingAnchor),
            coveringView.heightAnchor.constraint(equalToConstant: 96),
            coveringView.trailingAnchor.constraint(equalTo: trailingAnchor),
            coveringView.bottomAnchor.constraint(equalTo: bottomAnchor),

            dateLabel.leadingAnchor.constraint(equalTo: coveringView.leadingAnchor, constant: 6),
            dateLabel.topAnchor.constraint(equalTo: coveringView.topAnchor, constant: 11),
            dateLabel.heightAnchor.constraint(equalToConstant: 18),

            favoritePicture.trailingAnchor.constraint(equalTo: coveringView.trailingAnchor, constant: -10),
            favoritePicture.topAnchor.constraint(equalTo: coveringView.topAnchor, constant: 10),
            favoritePicture.widthAnchor.constraint(equalToConstant: 22),
            favoritePicture.heightAnchor.constraint(equalToConstant: 20.32),

            titleLabel.leadingAnchor.constraint(equalTo: coveringView.leadingAnchor, constant: 8),
            titleLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8),
            titleLabel.widthAnchor.constraint(equalToConstant: 148),
            titleLabel.heightAnchor.constraint(equalToConstant: 42)
        ])
    }
}

