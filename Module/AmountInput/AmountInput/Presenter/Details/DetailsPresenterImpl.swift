//
//  DetailsPresenterImpl.swift
//  AmountInput
//
//  Created by MacBook on 30/05/21.
//

import Foundation
import UIKit
import Core

class DetailsPresenterImpl: DetailsPresenter {
    
    let router: DetailsRouter

    init(router: DetailsRouter) {
        self.router = router
    }
    
    func backToConfirmPin(viewController: UIViewController, contact: ContactsEntity, amount: String, balance: String, date: String, notes: String) {
        self.router.navigateConfirmPin(viewController: viewController, contact: contact, amount: amount, balance: balance, date: date, notes: notes)
    }
    
    func backToHome() {
        self.router.navigateToHome()
    }
    
}

