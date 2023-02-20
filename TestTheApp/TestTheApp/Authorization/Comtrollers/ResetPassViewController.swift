//
//  ResetPassViewController.swift
//  TestTheApp
//
//  Created by Владимир Воробьев on 16.02.2023.
//

import UIKit
import FirebaseAuth

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
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if error != nil {
                self.resetFault()
                return
            } else { self.resetSuccess(email) }
        }
    }
    
    private func resetFault () {
        if email == "" {
           Alert.emtyField.call(self, nil, nil)
        } else {
            Alert.mailFailed.call(self, nil, nil)
        }
    }
    
    private func resetSuccess (_ email: String){
        navigationController?.popToRootViewController(animated: true)
    }
    
    // MARK: - Action Handlers
    
    @objc func handleResetPass() {
        resetPass(with: email)
    }
    
    private func configureDelegatesAndHandlers() {
        resetPassView.enterButton.addTarget(self, action: #selector(handleResetPass), for: .touchUpInside)
    }
}

