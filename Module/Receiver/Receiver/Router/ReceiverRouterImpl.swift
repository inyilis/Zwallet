//
//  ReceiverRouterImpl.swift
//  Receiver
//
//  Created by MacBook on 28/05/21.
//

import Foundation
import UIKit
import Core

public class ReceiverRouterImpl {
    
    public static func navigateToModule(viewController: UIViewController) {
        let bundle = Bundle(identifier: "com.casestudy.Receiver")
        let vc = ReceivefrViewController(nibName: "ReceivefrViewController", bundle: bundle)

        let networkManager = ReceiverNetworkManagerImpl()

        let router = ReceiverRouterImpl()
        let interactor = ReceiverInteractorImpl(receiverNetworkManager: networkManager)
        let presenter = ReceiverPresenterImpl(view: vc, interactor: interactor, router: router)

        interactor.interactorOutput = presenter
        
        vc.presenter = presenter

        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        viewController.present(vc, animated: true, completion: nil)
    }
}

extension ReceiverRouterImpl: ReceiverRouter {
    
    func navigateToAmountInput(viewController: UIViewController, contacts: ContactsEntity) {
        AppRouter.shared.navigateToAmount(viewController, contacts)
    }
    
    func navigateToHome() {
        NotificationCenter.default.post(name: Notification.Name("reloadRootView"), object: nil)
    }
    
}
