//
//  LoginPresenter.swift
//  Login
//
//  Created by MacBook on 24/05/21.
//

import Foundation
import UIKit

protocol LoginPresenter {
    func login(email: String, password: String)
    func toSetPin(viewController: UIViewController)
    func toSignUp(viewController: UIViewController)
}
