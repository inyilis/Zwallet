//
//  AmountInputPresenter.swift
//  AmountInput
//
//  Created by MacBook on 29/05/21.
//

import Foundation
import UIKit
import Core

protocol AmountInputPresenter {
    func toAmountConfirm(viewController: UIViewController, contact: ContactsEntity, amount: String, date: String, notes: String)
    func backToReceiver(viewController: UIViewController)
}
