//
//  AmountInputRouter.swift
//  AmountInput
//
//  Created by MacBook on 29/05/21.
//

import Foundation
import UIKit
import Core

protocol AmountInputRouter {
    func navigateToAmountConfirm(viewController: UIViewController, contact: ContactsEntity, amount: String, date: String, notes: String)
    func navigateToReceiver(viewController: UIViewController)
}
