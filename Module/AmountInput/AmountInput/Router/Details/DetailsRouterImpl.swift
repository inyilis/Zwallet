//
//  DetailsRouterImpl.swift
//  AmountInput
//
//  Created by MacBook on 30/05/21.
//

import Foundation
import UIKit
import Core

public class DetailsRouterImpl {
    
    public static func navigateToModule(viewController: UIViewController, contact: ContactsEntity, amount: String, balance: String, date: String, notes: String) {
        let bundle = Bundle(identifier: "com.casestudy.AmountInput")
        let vc = DetailsViewController(nibName: "DetailsViewController", bundle: bundle)
        vc.contactProfile = contact
        vc.amount = amount
        vc.balance = balance
        vc.date = date
        vc.notes = notes
        
        let router = DetailsRouterImpl()
        let presenter = DetailsPresenterImpl(router: router)
        
        vc.presenter = presenter

        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        viewController.present(vc, animated: true, completion: nil)
    }
}

extension DetailsRouterImpl: DetailsRouter {
    
    func navigateToHome() {
        NotificationCenter.default.post(name: Notification.Name("reloadRootView"), object: nil)
    }
    
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
    
}
