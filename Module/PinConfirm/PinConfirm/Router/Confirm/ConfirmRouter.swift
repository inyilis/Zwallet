//
//  ConfirmRouter.swift
//  PinConfirm
//
//  Created by MacBook on 30/05/21.
//

import Foundation
import UIKit
import Core

protocol ConfirmRouter {
    func navigateToAmountConfirm(viewController: UIViewController, contact: ContactsEntity, amount: String, date: String, notes: String)
    func navigateToDetails(viewController: UIViewController, contact: ContactsEntity, amount: String, balance: String, date: String, notes: String)
}
