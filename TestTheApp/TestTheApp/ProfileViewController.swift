//
//  ProfileViewController.swift
//  TestTheApp
//
//  Created by Владимир Воробьев on 15.02.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func resetButton(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
