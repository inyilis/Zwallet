//
//  AppRouter.swift
//  Core
//
//  Created by MacBook on 24/05/21.
//

import Foundation
import UIKit

public class AppRouter {
    
    public static let shared: AppRouter = AppRouter()
    
    public var loginScene: (() -> ())? = nil
    public func navigateToLogin() {
        self.loginScene?()
    }
    
    public var homeScene: (() -> ())? = nil
    public func navigateToHome() {
        self.homeScene?()
    }
    
    public var transferScene: ((_ viewController: UIViewController) -> ())? = nil
    public func navigateToTransfer(_ viewController: UIViewController) {
        self.transferScene?(viewController)
    }
    
    public var amountScene: ((_ viewController: UIViewController, _ contact: ContactsEntity) -> ())? = nil
    public func navigateToAmount(_ viewController: UIViewController, _ contact: ContactsEntity) {
        self.amountScene?(viewController, contact)
    }
    
    public var topUpScene: ((_ viewController: UIViewController) -> ())? = nil
    public func navigateToTopUp(_ viewController: UIViewController) {
        self.topUpScene?(viewController)
    }
    
    public var signUpScene: ((_ viewController: UIViewController) -> ())? = nil
    public func navigateToSignUp(_ viewController: UIViewController) {
        self.signUpScene?(viewController)
    }
    
    public var confirmOtpScene: ((_ viewController: UIViewController, _ email: String) -> ())? = nil
    public func navigateToConfirmOtp(_ viewController: UIViewController, _ email: String) {
        self.confirmOtpScene?(viewController, email)
    }
    
    public var createPinScene: ((_ viewController: UIViewController) -> ())? = nil
    public func navigateToCreatePin(_ viewController: UIViewController) {
        self.createPinScene?(viewController)
    }
    
    public var historyScene: ((_ viewController: UIViewController) -> ())? = nil
    public func navigateToHistory(_ viewController: UIViewController) {
        self.historyScene?(viewController)
    }
    
}
