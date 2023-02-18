//
//  NewsView.swift
//  TestTheApp
//
//  Created by Владимир Воробьев on 17.02.2023.
//

import UIKit

class NewsCellView: UIView {

    private lazy var picture: UIImageView = {
        let view = UIImageView()
        translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var favoritePicture: UIImageView = {
        let view = UIImageView()
        translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var contentTextView: UITextView = {
        let text = UITextView()
        translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
      
    init () {
        super.init(frame: CGRect.zero)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config (with model: NewsViewModel) {
        picture.image = UIImage(named: model.imageName)
        favoritePicture.image = UIImage(named: model.favoriteImageName)
        dateLabel.text = model.date
        titleLabel.text = model.title
        contentTextView.text = model.content
    }
    
    // MARK: - Subviews Setup
    
    private func setupSubviews() {
        backgroundColor = Colors.backgrounsView
        clipsToBounds = true
        setupConstraints ()
    }
    
    private func setupConstraints () {
        
    }
}
