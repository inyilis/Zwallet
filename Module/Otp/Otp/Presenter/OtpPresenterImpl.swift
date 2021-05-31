//
//  OtpPresenterImpl.swift
//  Otp
//
//  Created by MacBook on 26/05/21.
//

import Foundation

class OtpPresenterImpl: OtpPresenter {
    
    
    let view: OtpView
    let interactor: OtpInteractor
    let router: OtpRouter
    
    init(view: OtpView, interactor: OtpInteractor, router: OtpRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func confirmOtp(email: String, otp: String) {
        self.interactor.postOtpCode(email: email, otp: otp)
    }
    
    func toLogin() {
        self.router.navigateToLogin()
    }
    
}

extension OtpPresenterImpl: OtpInteractorOutput {
    
    func authenticationResult(isSuccess: Bool) {
        if isSuccess {
            self.view.showSuccess()
        } else {
            self.view.showError()
        }
    }
    
}
