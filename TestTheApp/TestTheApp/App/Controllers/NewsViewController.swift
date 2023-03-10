//
//  NewsTableViewController.swift
//  TestTheApp
//
//  Created by Владимир Воробьев on 17.02.2023.
//

import UIKit

class NewsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private lazy var models: [NewsViewModel] = {NewsData.models}()
    
    override func loadView() {
        super.loadView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension NewsViewController: UITableViewDataSource {
        
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 256
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as? NewsTableViewCell {
            cell.config(with: models[indexPath.row])
            return cell
        } else {
            return UITableViewCell()
        }
    }
}

extension NewsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ArticleViewController()
        vc.model = models[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
        navigationController?.isNavigationBarHidden = false
    }
}
