//
//  Alerts.swift
//  TestTheApp
//
//  Created by Владимир Воробьев on 20.02.2023.
//

import UIKit

enum Alert: String, Error {
    case identitiesFault = "Указан неправильный логин или пароль"
    case emtyField = "Заполните пустые поля"
    case mailFailed = "Проверьте корректность ввода почты"
    case exit = "Вы уверены, что хотите выйти из аккаунта?"
    
    func call (_ sender: UIViewController, _ handlerYes: ((UIAlertAction)->Void)?, _ handlerNo: ((UIAlertAction)->Void)?){
        switch self {
        case .identitiesFault, .emtyField, .mailFailed:
            let alertController = UIAlertController(title: "Ошибка", message: self.rawValue, preferredStyle: .alert)
            alertController.addAction(.init(title: "Oк", style: .default, handler: handlerYes))
            sender.present(alertController, animated: true, completion: nil)
        case .exit:
            let alertController = UIAlertController(title: "Выход", message: self.rawValue, preferredStyle: .alert)
            alertController.addAction(.init(title: "Отмена", style: .default, handler: handlerNo))
            alertController.addAction(.init(title: "Выход", style: .destructive, handler: handlerYes))
            sender.present(alertController, animated: true, completion: nil)
        }
    }
}
