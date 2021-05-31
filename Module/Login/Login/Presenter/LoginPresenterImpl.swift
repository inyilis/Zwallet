//
//  LoginPresenterImpl.swift
//  Login
//
//  Created by MacBook on 24/05/21.
//

import Foundation
import UIKit

class LoginPresenterImpl: LoginPresenter {
    
    let view: LoginView
    let interactor: LoginInteractor
    let router: LoginRouter
    
    init(view: LoginView, interactor: LoginInteractor, router: LoginRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func login(email: String, password: String) {
        self.interactor.postLoginData(email: email, password: password)
    }
    
    func toSetPin(viewController: UIViewController) {
        self.router.navigateSetPin(viewController: viewController)
    }
    
    func toSignUp(viewController: UIViewController) {
        self.router.navigateToSignUp(viewController: viewController)
    }
}

extension LoginPresenterImpl: LoginInteractorOuput {
    
    func authenticationResult(isSuccess: Bool, hasPin: Bool) {
        if isSuccess {
            if hasPin {
                self.router.navigateToHome()
            } else {
                self.view.toSetPin()
            }
        } else {
            self.view.showError()
        }
    }
    
}
