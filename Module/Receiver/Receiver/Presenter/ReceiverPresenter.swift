//
//  ReceiverPresenter.swift
//  Receiver
//
//  Created by MacBook on 28/05/21.
//

import Foundation
import UIKit
import Core

protocol ReceiverPresenter {
    func navigateToAmountInput(viewController: UIViewController, contacts: ContactsEntity)
    func loadGetAllContacts()
    func backToHome()
}
