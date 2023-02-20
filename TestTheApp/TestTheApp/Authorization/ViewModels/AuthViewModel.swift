//
//  AuthViewModel.swift
//  TestTheApp
//
//  Created by Владимир Воробьев on 16.02.2023.
//

import Foundation

struct AuthViewModel {
    // т.к. одна модель для двух вью, то два варианта
    enum ViewType {
        case authorization
        case registration
    }
    
    var viewType: ViewType
}
