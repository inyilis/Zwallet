//
//  SignUpRouter.swift
//  SignUp
//
//  Created by MacBook on 26/05/21.
//

import Foundation
import UIKit

protocol SignUpRouter {
    func navigateToLogin()
    func navigateToConfirmOtp(viewController: UIViewController, email: String)
}
