//
//  NewsView.swift
//  TestTheApp
//
//  Created by Владимир Воробьев on 17.02.2023.
//

import UIKit
/// Вью для ячейки таблицы Новости
final class NewsCellView: UIView {
    // Фотография
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
    // изображение сердечка избранное
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
    // Надпись заголовка
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.sfProSemi.withSize(16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // текстовое поле содержания статьи
    private lazy var contentTextView: UITextView = {
        let text = UITextView()
        text.font = Fonts.sfProNormal.withSize(13)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
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
    // Конфигурация изображения в соответствии с моделью
    func config (with model: NewsViewModel) {
        picture.image = UIImage(named: model.imageName)
        if model.favorite { favoritePicture.image = UIImage(named: "Избранное") }
        else { favoritePicture.image = UIImage(named: "Неизбранное") }
        dateLabel.text = model.date
        titleLabel.text = model.title
        contentTextView.text = model.content
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
        addSubview(contentTextView)
        
        NSLayoutConstraint.activate([
            picture.leadingAnchor.constraint(equalTo: leadingAnchor),
            picture.topAnchor.constraint(equalTo: topAnchor),
            picture.trailingAnchor.constraint(equalTo: trailingAnchor),
            picture.heightAnchor.constraint(equalTo: picture.widthAnchor, multiplier: 260 / 375),

            coveringView.leadingAnchor.constraint(equalTo: leadingAnchor),
            coveringView.heightAnchor.constraint(equalToConstant: 108),
            coveringView.trailingAnchor.constraint(equalTo: trailingAnchor),
            coveringView.bottomAnchor.constraint(equalTo: bottomAnchor),

            dateLabel.leadingAnchor.constraint(equalTo: coveringView.leadingAnchor, constant: 18),
            dateLabel.topAnchor.constraint(equalTo: coveringView.topAnchor, constant: 9),
            dateLabel.heightAnchor.constraint(equalToConstant: 18),

            favoritePicture.trailingAnchor.constraint(equalTo: coveringView.trailingAnchor, constant: -19),
            favoritePicture.topAnchor.constraint(equalTo: coveringView.topAnchor, constant: 10),
            favoritePicture.widthAnchor.constraint(equalToConstant: 22),
            favoritePicture.heightAnchor.constraint(equalToConstant: 20.32),

            titleLabel.leadingAnchor.constraint(equalTo: coveringView.leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 11),
            titleLabel.widthAnchor.constraint(equalToConstant: 313),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),

            contentTextView.leadingAnchor.constraint(equalTo: coveringView.leadingAnchor, constant: 16),
            contentTextView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            contentTextView.widthAnchor.constraint(equalToConstant: 313),
            contentTextView.heightAnchor.constraint(equalToConstant: 36)
        ])    
    }
}
