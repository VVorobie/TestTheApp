//
//  ArticleViewController.swift
//  TestTheApp
//
//  Created by Владимир Воробьев on 17.02.2023.
//

import UIKit

class ArticleViewController: UIViewController {
    
    private var articleView: ArticleView { view as! ArticleView }
    
    var model: NewsViewModel?
    
    // MARK: - View Controller Lifecycle Methods

    override func loadView() {
        if let viewModel = model {
            view = ArticleView(model: viewModel)
        } else {
            view = ArticleView()
        }        
    }
    
    override func viewDidLoad() {
        navigationItem.title = "Статья"
        super.viewDidLoad()
    }
}
