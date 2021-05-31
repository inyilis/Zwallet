//
//  HomeRouter.swift
//  Home
//
//  Created by MacBook on 25/05/21.
//

import Foundation
import UIKit

protocol HomeRouter {
    func navigateToTransfer(viewController: UIViewController)
    func navigateToTopUp(viewController: UIViewController)
    func navigateToHistory(viewController: UIViewController)
    func navigateToLogin()
}


