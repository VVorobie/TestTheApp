//
//  ProfileViewController.swift
//  TestTheApp
//
//  Created by Владимир Воробьев on 15.02.2023.
//

import UIKit

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
        navigationController?.popToRootViewController(animated: true)
    }

    func configureDelegatesAndHandlers() {
        profileView.exitButton.addTarget(self, action: #selector(handlerExit), for: .touchUpInside)
    }
}
