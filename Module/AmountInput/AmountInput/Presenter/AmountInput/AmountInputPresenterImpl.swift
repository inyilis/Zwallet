//
//  AmountInputPresenterImpl.swift
//  AmountInput
//
//  Created by MacBook on 29/05/21.
//

import Foundation
import UIKit
import Core

class AmountInputPresenterImpl: AmountInputPresenter {
    
    let router: AmountInputRouter

    init(router: AmountInputRouter) {
        self.router = router
    }

    func toAmountConfirm(viewController: UIViewController, contact: ContactsEntity, amount: String, date: String, notes: String) {
        self.router.navigateToAmountConfirm(viewController: viewController, contact: contact, amount: amount, date: date, notes: notes)
    }
    
    
    func backToReceiver(viewController: UIViewController) {
        self.router.navigateToReceiver(viewController: viewController)
    }
    
}
