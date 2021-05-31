//
//  AmountConfirmPresenterImpl.swift
//  AmountInput
//
//  Created by MacBook on 29/05/21.
//

import Foundation
import UIKit
import Core

class AmountConfirmPresenterImpl: AmountConfirmPresenter {
    let view: AmountConfirmView
    let interactor: AmountConfirmInteractor
    let router: AmountConfirmRouter
    
    init(view: AmountConfirmView, interactor: AmountConfirmInteractor, router: AmountConfirmRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func loadDetails() {
        self.interactor.getUserBalance()
    }
    
    func toConfirmPin(viewController: UIViewController, contact: ContactsEntity, amount: String, balance: String, date: String, notes: String) {
        self.router.navigateConfirmPin(viewController: viewController, contact: contact, amount: amount, balance: balance, date: date, notes: notes)
    }
    
    func backToAmountInput(viewController: UIViewController, contact: ContactsEntity) {
        self.router.navigateToAmountInput(viewController: viewController, contact: contact)
    }
    
}

extension AmountConfirmPresenterImpl: AmountConfirmInteractorOutput {
    
    func loadedUserBalanceData(userBalance: Int) {
        self.view.showDetailsData(userBalance: userBalance)
    }
    
}
