//
//  NewsViewModel.swift
//  TestTheApp
//
//  Created by Владимир Воробьев on 17.02.2023.
//

import Foundation

struct NewsViewModel {
    var id: Int
    let imageName: String
    let date: String
    let title: String
    let content: String?
    var favorite: Bool
}
