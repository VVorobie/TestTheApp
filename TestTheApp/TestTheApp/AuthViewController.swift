//
//  ViewController.swift
//  TestTheApp
//
//  Created by Владимир Воробьев on 14.02.2023.
//

import UIKit
import FirebaseAuth

class AuthViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
      super.viewDidDisappear(animated)
      //navigationController?.popViewController(animated: false)
    }
    
    @IBAction func button(_ sender: Any) {
            if let vc = self.storyboard?.instantiateViewController(withIdentifier: "TabBarController") {
                    vc.view.frame = self.view.bounds
                navigationController?.pushViewController(vc, animated: true)
                navigationController?.isNavigationBarHidden = true
                }
 
    }
    
}
