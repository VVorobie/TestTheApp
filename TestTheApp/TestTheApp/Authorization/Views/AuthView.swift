//
//  AuthView.swift
//  TestTheApp
//
//  Created by Владимир Воробьев on 16.02.2023.
//

import UIKit

/// Вью для экрана вторизации
final class AuthView: UIView {
    
    // MARK: - UI элементы
    // Заголовок
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.sfProBold.withSize(34)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // надпись "у вас есть пароль"
    private lazy var passPresenceLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.sfProNormal.withSize(13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // вью подложки под текстовое поле (Padding)
    private var padViewEmail: UIView!
    private var padViewPassword: UIView!
    // поля ввода логина и пароля
    var emailTextField: UITextField!
    var passwordTextField: UITextField!
    // кнопка ввода
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
    // кнопка перехода к регистрации (или наоборот)
    lazy var alternativeButton: UIButton = {
      let button = UIButton()
      button.translatesAutoresizingMaskIntoConstraints = false
      return button
    }()
    // кнопка перехода к сбросу пароля
    lazy var resetPassButton: UIButton = {
      let button = UIButton()
      button.setTitleColor(.secondaryLabel, for: .normal)
      button.setTitleColor(UIColor.secondaryLabel.withAlphaComponent(0.7), for: .highlighted)
        button.setTitle("Сбросить пароль", for: .normal)
      button.translatesAutoresizingMaskIntoConstraints = false
      return button
    }()
    
    // MARK: - Инициализация
    // Инициализатор для выбора типа вью и запуска конфигураций
    convenience init(model: AuthViewModel.ViewType) {
      self.init(frame: .zero)
      setupSubviews()
      config(with: model)
    }
    
    // MARK: - Установка и конфигурация созданных UI-элементов
    // Конфигурация элементов вью в зависимости от вида вида вью
    private func config(with model: AuthViewModel.ViewType) {
        switch model {
        case .authorization: // конфигурируем окно авторизации
            titleLabel.text = "Вход"
            enterButton.setTitle("Вход", for: .normal)
            passPresenceLabel.text = "Нет аккаунта?"
            setupPassPresenceLable(68, 94)
            setupAlternativeButton("Зарегистрироваться", 140)
            setupResetPassButton()
        case .registration: // конфигурируем окно регистрации
            titleLabel.text = "Регистрация"
            enterButton.setTitle("Зарегистрироваться", for: .normal)
            setupPassPresenceLable(100, 130)
            passPresenceLabel.text = "У вас есть аккаунт?"
            setupAlternativeButton("Войти", 41)
        }
    }
    // установка элементов
    private func setupSubviews() {
      // Конфиг самой вью
      backgroundColor = Colors.backgrounsView //#F5F5F5
      clipsToBounds = true
      // Создание текстовых полей
      padViewEmail = padForText()
      emailTextField = textField(placeholder: "Почта")
      padViewPassword = padForText()
      passwordTextField = textField(placeholder: "Пароль")
      passwordTextField.isSecureTextEntry = true
      // Установка констрейтов
      setupConstraints()
    }
    // Конфигурация надписи
    private func setupPassPresenceLable(_ leadingConstraint: CGFloat, _ width: CGFloat) {
        addSubview(passPresenceLabel)
        NSLayoutConstraint.activate([
        passPresenceLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: leadingConstraint),
        passPresenceLabel.topAnchor.constraint(equalTo: enterButton.bottomAnchor, constant: 20),
        passPresenceLabel.widthAnchor.constraint(equalToConstant: width),
        passPresenceLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    // Конфигурация алтернативы
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
    // Конфигурация кнопки сброса пароля
    private func setupResetPassButton() {
        addSubview(resetPassButton)
        NSLayoutConstraint.activate([
            resetPassButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 88),
            resetPassButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            resetPassButton.widthAnchor.constraint(equalToConstant: 200),
            resetPassButton.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    // Установка констрейтоа не зависящих от варианта вью
    private func setupConstraints () {
      addSubview(titleLabel)
      addSubview(padViewEmail)
      addSubview(emailTextField)
      addSubview(padViewPassword)
      addSubview(passwordTextField)
      addSubview(enterButton)
   
        NSLayoutConstraint.activate([
            
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 49),
            titleLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 214),
            titleLabel.heightAnchor.constraint(equalToConstant: 41),
            
            padViewEmail.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 38),
            padViewEmail.topAnchor.constraint(equalTo:titleLabel.bottomAnchor, constant: 45),
            padViewEmail.widthAnchor.constraint(equalToConstant: 300),
            padViewEmail.heightAnchor.constraint(equalToConstant: 44),
            
            emailTextField.leadingAnchor.constraint(equalTo: padViewEmail.leadingAnchor, constant: 20),
            emailTextField.topAnchor.constraint(equalTo: padViewEmail.topAnchor, constant: 11),
            emailTextField.widthAnchor.constraint(equalToConstant: 244),
            emailTextField.heightAnchor.constraint(equalToConstant: 22),
            
            padViewPassword.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 38),
            padViewPassword.topAnchor.constraint(equalTo: padViewEmail.bottomAnchor, constant: 15),
            padViewPassword.widthAnchor.constraint(equalToConstant: 300),
            padViewPassword.heightAnchor.constraint(equalToConstant: 44),
                    
            passwordTextField.leadingAnchor.constraint(equalTo: padViewPassword.leadingAnchor, constant: 20),
            passwordTextField.topAnchor.constraint(equalTo: padViewPassword.topAnchor, constant: 11),
            passwordTextField.widthAnchor.constraint(equalToConstant: 244),
            passwordTextField.heightAnchor.constraint(equalToConstant: 22),
          
            enterButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 88),
            enterButton.topAnchor.constraint(equalTo: padViewPassword.bottomAnchor, constant: 20),
            enterButton.widthAnchor.constraint(equalToConstant: 200),
            enterButton.heightAnchor.constraint(equalToConstant: 42),
        ])
    }
    
    // MARK: - Вспомагательные функции
    //создание подложки для текстовых полей
    private func padForText () -> UIView {
        let view = UIView()
        view.backgroundColor = Colors.backgrounsTextField
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    // создание текстовых полей
    private func textField(placeholder: String) -> UITextField {
      let textfield = UITextField()
      textfield.backgroundColor = Colors.backgrounsTextField
      textfield.layer.cornerRadius = 20
      textfield.placeholder = placeholder
      textfield.tintColor = Colors.textTextField
      textfield.font = Fonts.sfProNormal.withSize(17)
      textfield.translatesAutoresizingMaskIntoConstraints = false
      return textfield
    }
}

