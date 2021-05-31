//
//  AmountConfirm.swift
//  AmountInput
//
//  Created by MacBook on 29/05/21.
//

import Foundation
import UIKit
import Core

protocol AmountConfirmRouter {
    func navigateConfirmPin(viewController: UIViewController, contact: ContactsEntity, amount: String, balance: String, date: String, notes: String)
    func navigateToAmountInput(viewController: UIViewController, contact: ContactsEntity)
}

