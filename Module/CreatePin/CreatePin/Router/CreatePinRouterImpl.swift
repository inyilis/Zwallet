//
//  CreatePinRouterImpl.swift
//  CreatePin
//
//  Created by MacBook on 27/05/21.
//

import Foundation
import UIKit
import Core

public class CreatePinRouterImpl {
    
    public static func navigateToModule(viewController: UIViewController) {
        let bundle = Bundle(identifier: "com.casestudy.CreatePin")
        let vc = CreatePinViewController(nibName: "CreatePinViewController", bundle: bundle)
        
        let networkManager = AuthNetworkManagerImpl()

        let router = CreatePinRouterImpl()
        let interactor = CreatePinInteractorImpl(networkManager: networkManager)
        let presenter = CreatePinPresenterImpl(view: vc, interactor: interactor, router: router)

        interactor.interactorOutput = presenter

        vc.presenter = presenter
        
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        viewController.present(vc, animated: true, completion: nil)
    }
}

extension CreatePinRouterImpl: CreatePinRouter {
    
    func navigateToHome() {
        NotificationCenter.default.post(name: Notification.Name("reloadRootView"), object: nil)
    }
    
}
