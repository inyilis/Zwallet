//
//  AmountConfirmPresenter.swift
//  AmountInput
//
//  Created by MacBook on 29/05/21.
//

import Foundation
import UIKit
import Core

protocol AmountConfirmPresenter {
    func loadDetails()
    func toConfirmPin(viewController: UIViewController, contact: ContactsEntity, amount: String, balance: String, date: String, notes: String)
    func backToAmountInput(viewController: UIViewController, contact: ContactsEntity)
}
