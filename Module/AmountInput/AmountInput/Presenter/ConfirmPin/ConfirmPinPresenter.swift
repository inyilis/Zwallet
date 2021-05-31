//
//  ConfirmPinPresenter.swift
//  AmountInput
//
//  Created by MacBook on 30/05/21.
//

import Foundation
import UIKit
import Core

protocol ConfirmPinPresenter {
    func transferTo(receiver: Int, amount: Int, notes: String)
    func backToAmountConfirm(viewController: UIViewController, contact: ContactsEntity, amount: String, date: String, notes: String)
    func toDetails(viewController: UIViewController, contact: ContactsEntity, amount: String, balance: String, date: String, notes: String)
}
