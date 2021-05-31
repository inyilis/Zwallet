//
//  ConfirmPinPresenterImpl.swift
//  AmountInput
//
//  Created by MacBook on 30/05/21.
//

import Foundation
import UIKit
import Core

class ConfirmPinPresenterImpl: ConfirmPinPresenter {
    
    let view: ConfirmPinView
    let interactor: ConfirmPinInteractor
    let router: ConfirmPinRouter
    
    init(view: ConfirmPinView, interactor: ConfirmPinInteractor, router: ConfirmPinRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func transferTo(receiver: Int, amount: Int, notes: String) {
        self.interactor.transferTo(receiver: receiver, amount: amount, notes: notes)
    }
    
    func backToAmountConfirm(viewController: UIViewController, contact: ContactsEntity, amount: String, date: String, notes: String) {
        self.router.navigateToAmountConfirm(viewController: viewController, contact: contact, amount: amount, date: date, notes: notes)
    }
    
    func toDetails(viewController: UIViewController, contact: ContactsEntity, amount: String, balance: String, date: String, notes: String) {
        self.router.navigateToDetails(viewController: viewController, contact: contact, amount: amount, balance: balance, date: date, notes: notes)
    }
    
}

extension ConfirmPinPresenterImpl: ConfirmPinInteractorOutput {
    
    func transferResult(isSuccess: Bool) {
        if isSuccess {
            self.view.showSuccess()
        } else {
            self.view.showFailed()
        }
    }
    
}
