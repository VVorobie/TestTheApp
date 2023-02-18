//
//  ResetPassView.swift
//  TestTheApp
//
//  Created by Владимир Воробьев on 16.02.2023.
//

import UIKit

class ResetPassView: UIView {

    lazy var underView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.backgrounsTextField
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var emailTextField: UITextField! = {
        let textfield = UITextField()
        textfield.textContentType = .emailAddress
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.backgroundColor = Colors.backgrounsTextField
        textfield.layer.cornerRadius = 20
        textfield.placeholder = "Почта"
        textfield.tintColor = Colors.textTextField
        textfield.font = Fonts.sfProNormal.withSize(17)
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.sfProNormal.withSize(13)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.text = "Инструкция по сбросу пароля придёт к Вам на почту"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var enterButton: UIButton = {
      let button = UIButton()
      button.setTitleColor(.white, for: .normal)
      button.setTitleColor(UIColor.label.withAlphaComponent(0.7), for: .highlighted)
      button.setTitle("Сбросить пароль", for: .normal)
      button.backgroundColor = Colors.blueButton // #7592DD
      button.clipsToBounds = true
      button.layer.cornerRadius = 20
      button.translatesAutoresizingMaskIntoConstraints = false
      return button
    }()

    convenience init() {
      self.init(frame: .zero)
      setupSubviews()
    }
    
    // MARK: - Subviews Setup

    private func setupSubviews() {
      backgroundColor = Colors.backgrounsView //#F5F5F5
      clipsToBounds = true
      setupConstraints()
    }
    
    private func setupConstraints () {
        addSubview(underView)
        addSubview(emailTextField)
      addSubview(enterButton)
      addSubview(descriptionLabel)
   
        NSLayoutConstraint.activate([
            
            underView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 38),
            underView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            underView.widthAnchor.constraint(equalToConstant: 300),
            underView.heightAnchor.constraint(equalToConstant: 44),
            
            emailTextField.leadingAnchor.constraint(equalTo: underView.leadingAnchor, constant: 20),
            emailTextField.topAnchor.constraint(equalTo: underView.topAnchor, constant: 11),
            emailTextField.widthAnchor.constraint(equalToConstant: 244),
            emailTextField.heightAnchor.constraint(equalToConstant: 22),
            
            enterButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 88),
            enterButton.topAnchor.constraint(equalTo: underView.bottomAnchor, constant: 20),
            enterButton.widthAnchor.constraint(equalToConstant: 200),
            enterButton.heightAnchor.constraint(equalToConstant: 42),
                    
            descriptionLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 33),
            descriptionLabel.topAnchor.constraint(equalTo: enterButton.bottomAnchor, constant: 10),
            descriptionLabel.widthAnchor.constraint(equalToConstant: 310),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 36)
        ])
    }
}
