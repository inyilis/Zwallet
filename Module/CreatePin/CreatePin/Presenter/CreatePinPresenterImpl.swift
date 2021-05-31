//
//  CreatePinPresenterImpl.swift
//  CreatePin
//
//  Created by MacBook on 27/05/21.
//

import Foundation

class CreatePinPresenterImpl: CreatePinPresenter {
    
    let view: CreatePinView
    let interactor: CreatePinInteractor
    let router: CreatePinRouter
    
    init(view: CreatePinView, interactor: CreatePinInteractor, router: CreatePinRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func setPin(pin: String) {
        self.interactor.setPin(pin: pin)
    }
    
    func toHome() {
        self.router.navigateToHome()
    }
}

extension CreatePinPresenterImpl: CreatePinInteractorOutput {
    
    func setPinResult(isSuccess: Bool) {
        if isSuccess {
            self.view.showSuccess()
        }
    }
    
}
