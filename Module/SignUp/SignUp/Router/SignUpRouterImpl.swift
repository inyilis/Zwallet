//
//  SignUpRouterImpl.swift
//  SignUp
//
//  Created by MacBook on 26/05/21.
//

import Foundation
import UIKit
import Core

public class SignUpRouterImpl {
    
    public static func navigateToModule(viewController: UIViewController) {
        let bundle = Bundle(identifier: "com.casestudy.SignUp")
        let vc = SignUpViewController(nibName: "SignUpViewController", bundle: bundle)

        let networkManager = AuthNetworkManagerImpl()
        
        let router = SignUpRouterImpl()
        let interactor = SignUpInteractorImpl(networkManager: networkManager)
        let presenter = SignUpPresenterImpl(view: vc, interactor: interactor, router: router)

        interactor.interactorOutput = presenter

        vc.presenter = presenter

        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        viewController.present(vc, animated: true, completion: nil)
    }
        
}

extension SignUpRouterImpl: SignUpRouter {
    
    func navigateToLogin() {
        NotificationCenter.default.post(name: Notification.Name("reloadRootView"), object: nil)
    }
    
    func navigateToConfirmOtp(viewController: UIViewController, email: String) {
        AppRouter.shared.navigateToConfirmOtp(viewController, email)
    }
    
}
