//
//  LoginInteractorOuput.swift
//  Login
//
//  Created by MacBook on 24/05/21.
//

import Foundation

protocol LoginInteractorOuput {
    func authenticationResult(isSuccess: Bool, hasPin: Bool)
}
