//
//  AmountConfirmImpl.swift
//  AmountInput
//
//  Created by MacBook on 29/05/21.
//

import Foundation
import UIKit
import Core

public class AmountConfirmRouterImpl {
    
    public static func navigateToModule(viewController: UIViewController, contact: ContactsEntity, amount: String, date: String, notes: String) {
        let bundle = Bundle(identifier: "com.casestudy.AmountInput")
        let vc = AmountConfirmViewController(nibName: "AmountConfirmViewController", bundle: bundle)
        vc.contactProfile = contact
        vc.amount = amount
        vc.date = date
        vc.notes = notes
        
        let balanceNetworkManager = BalanceNetworkManagerImpl()
        
        let router = AmountConfirmRouterImpl()
        let interactor = AmountConfirmInteractorImpl(balanceNetworkManager: balanceNetworkManager)
        let presenter = AmountConfirmPresenterImpl(view: vc, interactor: interactor, router: router)
        
        interactor.interactorOutput = presenter
        
        vc.presenter = presenter

        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        viewController.present(vc, animated: true, completion: nil)
    }
}

extension AmountConfirmRouterImpl: AmountConfirmRouter {
    
    func navigateConfirmPin(viewController: UIViewController, contact: ContactsEntity,
                            amount: String, balance: String, date: String, notes: String) {
        ConfirmPinRouterImpl.navigateToModule(
            viewController: viewController,
            contact: contact,
            amount: amount,
            balance: balance,
            date: date,
            notes: notes
        )
    }
    
    func navigateToAmountInput(viewController: UIViewController, contact: ContactsEntity) {
        AppRouter.shared.navigateToAmount(viewController, contact)
    }
    
}
