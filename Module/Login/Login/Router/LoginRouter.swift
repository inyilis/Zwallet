//
//  LoginRouter.swift
//  Login
//
//  Created by MacBook on 24/05/21.
//

import Foundation
import UIKit

protocol LoginRouter {
    func navigateToHome()
    func navigateSetPin(viewController: UIViewController)
    func navigateToSignUp(viewController: UIViewController)
}
