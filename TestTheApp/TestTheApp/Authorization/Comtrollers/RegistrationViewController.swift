//
//  RegistrationViewController.swift
//  TestTheApp
//
//  Created by Владимир Воробьев on 16.02.2023.
//

import UIKit
import FirebaseAuth
/// Контроллер окна регистрации (устроен аналогично контроллеру авторизации)
final class RegistrationViewController: UIViewController {
    
    private var registrationView: AuthView { view as! AuthView }
    private var email: String { registrationView.emailTextField.text! }
    private var password: String { registrationView.passwordTextField.text! }
  
    // MARK: - View Controller Lifecycle Methods

    override func loadView() {
        view = AuthView(model: .registration)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDelegatesAndHandlers()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        registrationView.emailTextField.text = ""
        registrationView.passwordTextField.text = ""
    }
        
    // MARK: - Firebase

    private func registration(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if error != nil {
                self.registrationFault()
                return
            } else { self.registrationSuccess(email) }
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
        registrationView.enterButton.addTarget(self, action: #selector(handleRegistration), for: .touchUpInside)
        registrationView.alternativeButton.addTarget(self, action: #selector(handleLogin),for: .touchUpInside)
    }
    
    // MARK: - Actions
    
    private func registrationFault () {
        if email == "" || password == "" {
            Alert.emtyField.call(self, nil, nil)
        } else {
            Alert.mailFailed.call(self, nil, nil)
        }
    }
    
    private func registrationSuccess (_ email: String){
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

