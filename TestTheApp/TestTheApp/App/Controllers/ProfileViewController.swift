//
//  ProfileViewController.swift
//  TestTheApp
//
//  Created by Владимир Воробьев on 15.02.2023.
//

import UIKit
import Firebase

final class ProfileViewController: UIViewController {

    private var profileView: ProfileView { view as! ProfileView }
    
    lazy var model: ProfileViewModel = {
        return ProfileViewModel(photoName: CurrentUser.photo ?? "Фото",
                                name: CurrentUser.name,
                                email: CurrentUser.email ?? "")
    }()
    
    // MARK: - View Controller Lifecycle Methods
    
    override func loadView() {
        view = ProfileView(model: model)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDelegatesAndHandlers()
    }
    
    // MARK: - Action Handlers
    
    @objc private func handlerExit() {
        exitCurrentUser()
    }

    func configureDelegatesAndHandlers() {
        profileView.exitButton.addTarget(self, action: #selector(handlerExit), for: .touchUpInside)
    }
    
    // MARK: - Actions
    // Выход из программы текущего пользователя
    private func exitCurrentUser () {
        Alert.exit.call(self, { _ in  // вызов оповещения
            try? Auth.auth().signOut() // затем выход в FireBase
            CurrentUser.email = nil   // обнуление даннх текущего пользователя
            CurrentUser.name = nil
            CurrentUser.id = nil
            CurrentUser.photo = nil
            self.navigationController?.popToRootViewController(animated: true)
        }, nil)
    }
}
