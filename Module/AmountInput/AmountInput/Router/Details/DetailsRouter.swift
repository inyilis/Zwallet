//
//  DetailsRouter.swift
//  AmountInput
//
//  Created by MacBook on 30/05/21.
//

import Foundation
import UIKit
import Core

protocol DetailsRouter {
    func navigateToHome()
    func navigateConfirmPin(viewController: UIViewController, contact: ContactsEntity, amount: String, balance: String, date: String, notes: String)
}
