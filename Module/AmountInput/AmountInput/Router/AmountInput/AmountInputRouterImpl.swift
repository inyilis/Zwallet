//
//  AmountInputRouterImpl.swift
//  AmountInput
//
//  Created by MacBook on 29/05/21.
//

import Foundation
import UIKit
import Core

public class AmountInputRouterImpl {
    
    public static func navigateToModule(viewController: UIViewController, contact: ContactsEntity) {
        let bundle = Bundle(identifier: "com.casestudy.AmountInput")
        let vc = AmountInputViewController(nibName: "AmountInputViewController", bundle: bundle)
        vc.contactProfile = contact
        
        let router = AmountInputRouterImpl()
        let presenter = AmountInputPresenterImpl(router: router)
        
        vc.presenter = presenter

        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        viewController.present(vc, animated: true, completion: nil)
    }
}

extension AmountInputRouterImpl: AmountInputRouter {
    
    func navigateToAmountConfirm(viewController: UIViewController, contact: ContactsEntity, amount: String, date: String, notes: String) {
        AmountConfirmRouterImpl.navigateToModule(viewController: viewController, contact: contact, amount: amount, date: date, notes: notes)
    }
    
    func navigateToReceiver(viewController: UIViewController) {
        AppRouter.shared.navigateToTransfer(viewController)
    }
    
}
