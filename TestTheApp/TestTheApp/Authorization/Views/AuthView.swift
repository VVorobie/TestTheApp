//
//  AuthView.swift
//  TestTheApp
//
//  Created by Владимир Воробьев on 16.02.2023.
//

import UIKit

class AuthView: UIView {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.sfProBold.withSize(34)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var passPresenceLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.sfProNormal.withSize(13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var emailTextField: PaddingTextField! {
      didSet {
        emailTextField.textContentType = .emailAddress
      }
    }
    
    var passwordTextField: PaddingTextField! {
      didSet {
        passwordTextField.textContentType = .password
      }
    }

    lazy var enterButton: UIButton = {
      let button = UIButton()
      button.setTitleColor(.white, for: .normal)
      button.setTitleColor(UIColor.label.withAlphaComponent(0.7), for: .highlighted)
      button.backgroundColor = Colors.blueButton // #7592DD
      button.clipsToBounds = true
      button.layer.cornerRadius = 20
      button.translatesAutoresizingMaskIntoConstraints = false
      return button
    }()
    
    lazy var alternativeButton: UIButton = {
      let button = UIButton()
      button.translatesAutoresizingMaskIntoConstraints = false
      return button
    }()
    
    lazy var resetPassButton: UIButton = {
      let button = UIButton()
      button.setTitleColor(.secondaryLabel, for: .normal)
      button.setTitleColor(UIColor.secondaryLabel.withAlphaComponent(0.7), for: .highlighted)
        button.setTitle("Сбросить пароль", for: .normal)
      button.translatesAutoresizingMaskIntoConstraints = false
      return button
    }()
    
    convenience init(model: AuthViewModel.ViewType) {
      self.init(frame: .zero)
      setupSubviews()
      config(with: model)
    }
    
    func config(with model: AuthViewModel.ViewType) {
        switch model {
        case .authorization:
            titleLabel.text = "Вход"
            enterButton.setTitle("Вход", for: .normal)
            passPresenceLabel.text = "Нет аккаунта?"
            setupPassPresenceLable(68, 94)
            setupAlternativeButton("Зарегистрироваться", 140)
            setupResetPassButton()
        case .registration:
            titleLabel.text = "Регистрация"
            enterButton.setTitle("Зарегистрироваться", for: .normal)
            setupPassPresenceLable(100, 130)
            passPresenceLabel.text = "У вас есть аккаунт?"
            setupAlternativeButton("Войти", 41)
        }
    }
    
    
    // MARK: - Subviews Setup

    private func setupSubviews() {
      backgroundColor = Colors.backgrounsView //#F5F5F5
      clipsToBounds = true

      setupEmailTextfield()
      setupPasswordTextField()
      setupConstraints()

    }

    private func setupEmailTextfield() {
      emailTextField = textField(placeholder: "Почта")
      emailTextField.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupPasswordTextField() {
      passwordTextField = textField(placeholder: "Пароль")
      passwordTextField.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupPassPresenceLable(_ leadingConstraint: CGFloat, _ width: CGFloat) {
        addSubview(passPresenceLabel)
        NSLayoutConstraint.activate([
        passPresenceLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: leadingConstraint),
        passPresenceLabel.topAnchor.constraint(equalTo: enterButton.bottomAnchor, constant: 20),
        passPresenceLabel.widthAnchor.constraint(equalToConstant: width),
        passPresenceLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    private func setupAlternativeButton(_ text: String, _ width: CGFloat) {
        var title = NSAttributedString(string: text, attributes: [.font: Fonts.sfProBold.withSize(13), .foregroundColor: Colors.blueButton])
        alternativeButton.setAttributedTitle(title, for: .normal)
        title = NSAttributedString(string: text, attributes: [.font: Fonts.sfProBold.withSize(13), .foregroundColor: Colors.blueButton.withAlphaComponent(0.7)])
        alternativeButton.setAttributedTitle(title, for: .highlighted)
       
        addSubview(alternativeButton)
        
        NSLayoutConstraint.activate([
        alternativeButton.leadingAnchor.constraint(equalTo: passPresenceLabel.trailingAnchor, constant: 6),
        alternativeButton.topAnchor.constraint(equalTo: enterButton.bottomAnchor, constant: 20),
        alternativeButton.widthAnchor.constraint(equalToConstant: width),
        alternativeButton.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    private func setupResetPassButton() {
        addSubview(resetPassButton)
        NSLayoutConstraint.activate([
            resetPassButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 88),
            resetPassButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            resetPassButton.widthAnchor.constraint(equalToConstant: 200),
            resetPassButton.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func setupConstraints () {
      addSubview(titleLabel)
      addSubview(emailTextField)
      addSubview(passwordTextField)
      addSubview(enterButton)
   
        NSLayoutConstraint.activate([
            
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 49),
            titleLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 214),
            titleLabel.heightAnchor.constraint(equalToConstant: 41),
            
            emailTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 38),
            emailTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 45),
            emailTextField.widthAnchor.constraint(equalToConstant: 300),
            emailTextField.heightAnchor.constraint(equalToConstant: 44),
                    
          passwordTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 38),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15),
          passwordTextField.widthAnchor.constraint(equalToConstant: 300),
          passwordTextField.heightAnchor.constraint(equalToConstant: 44),
          
          enterButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 88),
          enterButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
          enterButton.widthAnchor.constraint(equalToConstant: 200),
          enterButton.heightAnchor.constraint(equalToConstant: 42),
        ])
    }

    // MARK: - Private Helpers

    private func textField(placeholder: String) -> PaddingTextField {
      let textfield = PaddingTextField()
      textfield.backgroundColor = Colors.backgrounsTextField
      textfield.layer.cornerRadius = 20
      textfield.placeholder = placeholder
      textfield.tintColor = Colors.textTextField
      textfield.font = Fonts.sfProNormal.withSize(17)
//        textfield.textAlignment = .center
      textfield.translatesAutoresizingMaskIntoConstraints = false
      return textfield
    }
}

