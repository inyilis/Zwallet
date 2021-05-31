//
//  ConfirmRouterImpl.swift
//  PinConfirm
//
//  Created by MacBook on 30/05/21.
//

import Foundation
import UIKit
import Core

public class ConfirmRouterImpl {
    
    public static func navigateToModule(viewController: UIViewController, contact: ContactsEntity, amount: String, balance: String, date: String, notes: String) {
        let bundle = Bundle(identifier: "com.casestudy.PinConfirm")
        let vc = ConfirmViewController(nibName: "ConfirmViewController", bundle: bundle)
//        vc.contactProfile = contact
//        vc.amount = amount
//        vc.date = date
//        vc.notes = notes
//
//        let balanceNetworkManager = BalanceNetworkManagerImpl()
//
//        let router = AmountConfirmRouterImpl()
//        let interactor = AmountConfirmInteractorImpl(balanceNetworkManager: balanceNetworkManager)
//        let presenter = AmountConfirmPresenterImpl(view: vc, interactor: interactor, router: router)
//
//        interactor.interactorOutput = presenter
//
//        vc.presenter = presenter

        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        viewController.present(vc, animated: true, completion: nil)
    }
}

extension ConfirmRouterImpl: ConfirmRouter {
    func navigateToAmountConfirm(viewController: UIViewController, contact: ContactsEntity, amount: String, date: String, notes: String) {
        <#code#>
    }
    
    func navigateToDetails(viewController: UIViewController, contact: ContactsEntity, amount: String, balance: String, date: String, notes: String) {
        <#code#>
    }
    
    
    
    func navigateConfirmPin() {
    }
    
    func navigateToAmountInput(viewController: UIViewController, contact: ContactsEntity) {
        AppRouter.shared.navigateToAmount(viewController, contact)
    }
    
}
