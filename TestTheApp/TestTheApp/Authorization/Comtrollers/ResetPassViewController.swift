//
//  ResetPassViewController.swift
//  TestTheApp
//
//  Created by Владимир Воробьев on 16.02.2023.
//

import UIKit

class ResetPassViewController: UIViewController {

    private var resetPassView: ResetPassView{ view as! ResetPassView }

    private var email: String { resetPassView.emailTextField.text! }
    
    // MARK: - View Controller Lifecycle Methods

    override func loadView() {
        view = ResetPassView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDelegatesAndHandlers()
        navigationItem.title = "Сброс пароля"
    }
    
    override func viewDidDisappear(_ animated: Bool) {
      super.viewDidDisappear(animated)
        resetPassView.emailTextField.text = ""
    }
    
    
    // MARK: - Firebase

    private func resetPass(with email: String) {
//      Auth.auth().signIn(withEmail: email, password: password) { result, error in
//        guard error == nil else { return } //----------------------
//          if let vc = self.storyboard?.instantiateViewController(withIdentifier: "TabBarController") {
//            vc.view.frame = self.view.bounds
//            self.navigationController?.pushViewController(vc, animated: true)
//            self.navigationController?.isNavigationBarHidden = true
//          }
//      }
    }
    
    // MARK: - Action Handlers

    @objc
    private func handleLogin() {
        resetPass(with: email)
    }

    @objc
    private func handleRegistration() {
      let vc = RegistrationViewController()
      navigationController?.pushViewController(vc, animated: true)
      self.navigationController?.isNavigationBarHidden = true
    }
    
    @objc func handleResetPass() {
        
    }
    
    private func configureDelegatesAndHandlers() {
//        resetPassView.emailTextField.delegate = self
        resetPassView.enterButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
    }
    
}
//
//// MARK: - UITextFieldDelegate
//
//extension AuthViewController: UITextFieldDelegate {
//  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//    if authView.emailTextField.isFirstResponder, authView.passwordTextField.text!.isEmpty {
//        authView.passwordTextField.becomeFirstResponder()
//    } else {
//      textField.resignFirstResponder()
//    }
//    return true
//  }
//
//}
