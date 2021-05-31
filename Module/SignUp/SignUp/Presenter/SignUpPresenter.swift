//
//  SignUpPresenter.swift
//  SignUp
//
//  Created by MacBook on 26/05/21.
//

import Foundation
import UIKit

protocol SignUpPresenter {
    func signUp(username: String, email: String, password: String)
    func toConfirmOtp(viewController: UIViewController, email: String)
    func toLogin()
}
