//
//  RegistrationViewController.swift
//  TestTheApp
//
//  Created by Владимир Воробьев on 16.02.2023.
//

import UIKit
import FirebaseAuth

protocol RegistrationViewControllerDelegate: AnyObject {
    func newUserDidOccur()
}

class RegistrationViewController: UIViewController {
    weak var delegate: RegistrationViewControllerDelegate?
    
    private var registrationView: AuthView { view as! AuthView }
    private var email: String { registrationView.emailTextField.text! }
    private var password: String { registrationView.passwordTextField.text! }

    //    // Hides tab bar when view controller is presented
        override var hidesBottomBarWhenPushed: Bool { get { true } set {} }
    //    self.navigationController?.isNavigationBarHidden = true

        
        // MARK: - View Controller Lifecycle Methods

        override func loadView() {
            view = AuthView(model: .registration)
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
            registrationView.emailTextField.text = ""
            registrationView.passwordTextField.text = ""
        }
        
        // MARK: - Firebase

    private func registration(email: String, password: String) {
      Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
        guard error == nil else { return } //------------------Alert
          //---------------------------------Alert
          self.delegate?.newUserDidOccur()
          self.navigationController?.popViewController(animated: true)          
      }
    }
        
        // MARK: - Action Handlers

        @objc
        private func handleRegistration() {
            registration(email: email, password: password)
        }
    
        @objc
        private func handleLogin() {
            navigationController?.popViewController(animated: true)
        }
        
        private func configureDelegatesAndHandlers() {
            registrationView.emailTextField.delegate = self
            registrationView.passwordTextField.delegate = self
            registrationView.enterButton.addTarget(self, action: #selector(handleRegistration), for: .touchUpInside)
            registrationView.alternativeButton.addTarget(self, action: #selector(handleLogin),for: .touchUpInside)
        }
        
    }

    // MARK: - UITextFieldDelegate

    extension RegistrationViewController: UITextFieldDelegate {
      func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if registrationView.emailTextField.isFirstResponder, registrationView.passwordTextField.text!.isEmpty {
            registrationView.passwordTextField.becomeFirstResponder()
        } else {
          textField.resignFirstResponder()
        }
        return true
      }
    }
