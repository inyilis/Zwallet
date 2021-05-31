//
//  SignUpPresenterImpl.swift
//  SignUp
//
//  Created by MacBook on 26/05/21.
//

import Foundation
import UIKit
import Otp

class SignUpPresenterImpl: SignUpPresenter {
    
    let view: SignUpView
    let interactor: SignUpInteractor
    let router: SignUpRouter
    
    init(view: SignUpView, interactor: SignUpInteractor, router: SignUpRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func signUp(username: String, email: String, password: String) {
        self.interactor.postSignUpData(username: username, email: email, password: password)
    }
    
    func toConfirmOtp(viewController: UIViewController, email: String) {
        self.router.navigateToConfirmOtp(viewController: viewController, email: email)
    }
    
    func toLogin() {
        self.router.navigateToLogin()
    }
    
}

extension SignUpPresenterImpl: SignUpInteractorOutput {
    
    func authenticationResult(isSuccess: Bool) {
        if isSuccess {
            self.view.confirmOtp()
        } else {
            self.view.showError()
        }
    }
    
}
