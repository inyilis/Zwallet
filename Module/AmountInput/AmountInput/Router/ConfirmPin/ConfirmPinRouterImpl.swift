//
//  ConfirmPinImpl.swift
//  AmountInput
//
//  Created by MacBook on 30/05/21.
//

import Foundation
import UIKit
import Core

public class ConfirmPinRouterImpl {
    
    public static func navigateToModule(viewController: UIViewController, contact: ContactsEntity, amount: String, balance: String, date: String, notes: String) {
        let bundle = Bundle(identifier: "com.casestudy.AmountInput")
        let vc = ConfirmPinViewController(nibName: "ConfirmPinViewController", bundle: bundle)
        vc.contactProfile = contact
        vc.amount = amount
        vc.balance = balance
        vc.date = date
        vc.notes = notes

        let transferNetworkManager = TransferNetworkManagerImpl()

        let router = ConfirmPinRouterImpl()
        let interactor = ConfirmPinInteractorImpl(transferNetworkManager: transferNetworkManager)
        let presenter = ConfirmPinPresenterImpl(view: vc, interactor: interactor, router: router)

        interactor.interactorOutput = presenter

        vc.presenter = presenter

        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        viewController.present(vc, animated: true, completion: nil)
    }
}

extension ConfirmPinRouterImpl: ConfirmPinRouter {
    
    func navigateToAmountConfirm(viewController: UIViewController, contact: ContactsEntity, amount: String, date: String, notes: String) {
        AmountConfirmRouterImpl.navigateToModule(viewController: viewController, contact: contact, amount: amount, date: date, notes: notes)
    }
    
    func navigateToDetails(viewController: UIViewController, contact: ContactsEntity, amount: String, balance: String, date: String, notes: String) {
        DetailsRouterImpl.navigateToModule(viewController: viewController, contact: contact, amount: amount, balance: balance, date: date, notes: notes)
    }
    
}
