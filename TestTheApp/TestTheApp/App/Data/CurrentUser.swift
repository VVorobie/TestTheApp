//
//  CurrentUser.swift
//  TestTheApp
//
//  Created by Владимир Воробьев on 19.02.2023.
//

import Foundation

struct CurrentUser {
    static var id: Int = 0
    static var name: String = ""
    static var email: String = "test@mail.ru"
    static var photo: String = "Фото"
    
    func getCurrentUser (_ email: String?){
        if let mail = email {
            CurrentUser.email = mail
        }
    }
}
