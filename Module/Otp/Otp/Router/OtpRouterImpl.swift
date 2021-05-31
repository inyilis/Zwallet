//
//  OtpRouterImpl.swift
//  Otp
//
//  Created by MacBook on 26/05/21.
//

import Foundation
import UIKit
import Core

public class OtpRouterImpl {
    
    public static func navigateToModule(viewController: UIViewController, email: String) {
        let bundle = Bundle(identifier: "com.casestudy.Otp")
        let vc = OtpViewController(nibName: "OtpViewController", bundle: bundle)
        
        vc.email = email

        let networkManager = AuthNetworkManagerImpl()

        let router = OtpRouterImpl()
        let interactor = OtpInteractorImpl(networkManager: networkManager)
        let presenter = OtpPresenterImpl(view: vc, interactor: interactor, router: router)

        interactor.interactorOutput = presenter

        vc.presenter = presenter

        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        viewController.present(vc, animated: true, completion: nil)
    }
        
}

extension OtpRouterImpl: OtpRouter {
    
    func navigateToLogin() {
        NotificationCenter.default.post(name: Notification.Name("reloadRootView"), object: nil)
    }
    
}


