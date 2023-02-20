//
//  ViewController.swift
//  TestTheApp
//
//  Created by Владимир Воробьев on 14.02.2023.
//

import UIKit
import FirebaseAuth

class AuthViewController: UIViewController {
    
    private var authView: AuthView { view as! AuthView }

    private var email: String { authView.emailTextField.text! }
    private var password: String { authView.passwordTextField.text! }

//    // Hides tab bar when view controller is presented
    override var hidesBottomBarWhenPushed: Bool { get { true } set {} }
//    self.navigationController?.isNavigationBarHidden = true

    
    // MARK: - View Controller Lifecycle Methods

    override func loadView() {
        view = AuthView(model: .authorization)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureDelegatesAndHandlers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
      super.viewWillDisappear(animated)
      view.endEditing(true)
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
    
    private func loginFault () {
        if email == "" || password == "" {
            Alert.emtyField.call(self, nil, nil)
        } else {
            Alert.identitiesFault.call(self, nil, nil)
        }
    }
    
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
        authView.emailTextField.delegate = self
        authView.passwordTextField.delegate = self
        authView.enterButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        authView.alternativeButton.addTarget(self, action: #selector(handleRegistration),for: .touchUpInside)
        authView.resetPassButton.addTarget(self, action: #selector(handleResetPass),for: .touchUpInside)
    }
}

// MARK: - UITextFieldDelegate

extension AuthViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if authView.emailTextField.isFirstResponder, authView.passwordTextField.text!.isEmpty {
        authView.passwordTextField.becomeFirstResponder()
    } else {
      textField.resignFirstResponder()
    }
    return true
  }
}
