//
//  ViewController.swift
//  TestTheApp
//
//  Created by Владимир Воробьев on 14.02.2023.
//

import UIKit
import FirebaseAuth
/// Контроллер вью авторизации
final class AuthViewController: UIViewController {
    // наше вью как бы подменяет собой вью контроллера
    private var authView: AuthView { view as! AuthView }
    private var email: String { authView.emailTextField.text! }
    private var password: String { authView.passwordTextField.text! }
  
    // MARK: - View Controller Lifecycle Methods

    override func loadView() {
        view = AuthView(model: .authorization)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(UIFont.fontNames(forFamilyName: "SF Pro Display"))
        configureDelegatesAndHandlers()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
      super.viewDidDisappear(animated)
        authView.emailTextField.text = ""
        authView.passwordTextField.text = ""
    }
    
    // MARK: - Firebase login
    
    private func login(with email: String, password: String) {
      Auth.auth().signIn(withEmail: email, password: password) { result, error in
          if error != nil {
              self.loginFault()
              return
          } else { self.loginSuccess(email) }
      }
    }
    
    // MARK: - Action Handlers

    @objc
    private func handleLogin() {
      login(with: email, password: password)
    }

    @objc
    private func handleRegistration() {
      let vc = RegistrationViewController()
      navigationController?.pushViewController(vc, animated: true)
      self.navigationController?.isNavigationBarHidden = true
    }
    
    @objc func handleResetPass() {
        let vc = ResetPassViewController()
        self.navigationController?.isNavigationBarHidden = false
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func configureDelegatesAndHandlers() {
        authView.enterButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        authView.alternativeButton.addTarget(self, action: #selector(handleRegistration),for: .touchUpInside)
        authView.resetPassButton.addTarget(self, action: #selector(handleResetPass),for: .touchUpInside)
    }
    
    // MARK: - Actions
    // В случае неудачной попытки зайте, вывешиваем различные сообщения
    private func loginFault () {
        if email == "" || password == "" {
            Alert.emtyField.call(self, nil, nil)
        } else {
            Alert.identitiesFault.call(self, nil, nil)
        }
    }
    // в случае успешного логина пересылаем его данные в Current User. если такого нет, заводим.
    private func loginSuccess (_ email: String){
        if !Persistance.shared.getCurrentUser(userEmail: email) {
            Persistance.shared.createNewUser(email)
            let _ = Persistance.shared.getCurrentUser(userEmail: email)
        }
        if let vc = storyboard?.instantiateViewController(withIdentifier: "TabBarController") {
          vc.view.frame = view.bounds
          navigationController?.pushViewController(vc, animated: true)
          navigationController?.isNavigationBarHidden = true
        }
    }
}
