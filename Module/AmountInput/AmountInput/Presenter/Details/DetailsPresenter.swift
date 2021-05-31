//
//  DetailsPresenter.swift
//  AmountInput
//
//  Created by MacBook on 30/05/21.
//

import Foundation
import UIKit
import Core

protocol DetailsPresenter {
    func backToConfirmPin(viewController: UIViewController, contact: ContactsEntity, amount: String, balance: String, date: String, notes: String)
    func backToHome()
}
