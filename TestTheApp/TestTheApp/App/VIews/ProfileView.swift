//
//  ProfileView.swift
//  TestTheApp
//
//  Created by Владимир Воробьев on 19.02.2023.
//

import UIKit
/// Изображение для окна профиля
final class ProfileView: UIView {
    // фото профиля
    private lazy var picture: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 60
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    // Заголовок окна
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.sfProBold.withSize(34)
        label.text = "Профиль"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // Подкладка под текстовое поле (Pad)
    private var namePadView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        view.backgroundColor = Colors.backgrounsView
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    // Поле имя
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.font = Fonts.sfProNormal.withSize(17)
        textField.textColor = Colors.textProfile
        textField.placeholder = "Имя"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    // Подкладка под надпись
    private var emailPadView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        view.backgroundColor = Colors.backgrounsView
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    // Надпись почты
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.sfProNormal.withSize(17)
        label.textColor = Colors.textProfile
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // Кнопка Выход
    lazy var exitButton: UIButton = {
        let button = UIButton()
        var attribString = NSAttributedString(string: "Выйти", attributes: [.font: Fonts.sfProNormal.withSize(17), .foregroundColor: Colors.redExitButton])
        button.setAttributedTitle(attribString, for: .normal)
        attribString = NSAttributedString(string: "Выйти", attributes: [.font: Fonts.sfProNormal.withSize(17), .foregroundColor: Colors.redExitButton.withAlphaComponent(0.7)])
        button.setAttributedTitle(attribString, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
  
    // MARK: - Инициализаторы
    // Переписанный инициализатор для установки суб изображений и конфигурации с моделью
    convenience init(model: ProfileViewModel) {
        self.init(frame: .zero)
        setupView()
        config(with: model)
    }

    // MARK: - Subviews Setup
    //Конфигурация  в соответствии с моделью
    func config (with model: ProfileViewModel) {
        picture.image = UIImage(named: model.photoName)
        nameTextField.text = model.name
        emailLabel.text = model.email
    }
    
    private func setupView() {
        backgroundColor = .white //#FFFFFF
        clipsToBounds = true
                
        setupConstraints ()
    }
    
    private func setupConstraints () {
        addSubview(titleLabel)
        addSubview(picture)
        addSubview(namePadView)
        addSubview(nameTextField)
        addSubview(emailPadView)
        addSubview(emailLabel)
        addSubview(exitButton)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant:  30),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 49),
            titleLabel.heightAnchor.constraint(equalToConstant: 41),
            
            picture.centerXAnchor.constraint(equalTo: centerXAnchor),
            picture.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            picture.widthAnchor.constraint(equalToConstant: 120),
            picture.heightAnchor.constraint(equalToConstant: 120),

            namePadView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            namePadView.topAnchor.constraint(equalTo: picture.bottomAnchor, constant: 17),
            namePadView.widthAnchor.constraint(equalToConstant: 300),
            namePadView.heightAnchor.constraint(equalToConstant: 44),

            nameTextField.leadingAnchor.constraint(equalTo: namePadView.leadingAnchor, constant: 10),
            nameTextField.topAnchor.constraint(equalTo: namePadView.topAnchor, constant: 11),
            nameTextField.widthAnchor.constraint(equalToConstant: 264),
            nameTextField.heightAnchor.constraint(equalToConstant: 22),

            emailPadView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            emailPadView.topAnchor.constraint(equalTo: namePadView.bottomAnchor, constant: 16),
            emailPadView.widthAnchor.constraint(equalToConstant: 300),
            emailPadView.heightAnchor.constraint(equalToConstant: 44),

            emailLabel.leadingAnchor.constraint(equalTo: emailPadView.leadingAnchor, constant: 10),
            emailLabel.topAnchor.constraint(equalTo: emailPadView.bottomAnchor, constant: 11),
            emailLabel.widthAnchor.constraint(equalToConstant: 264),
            emailLabel.heightAnchor.constraint(equalToConstant: 22),
            
            exitButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            exitButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -114),
            exitButton.widthAnchor.constraint(equalToConstant: 91),
            exitButton.heightAnchor.constraint(equalToConstant: 22)
        ])
    }
}
