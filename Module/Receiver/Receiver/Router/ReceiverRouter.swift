//
//  ReceiverRouter.swift
//  Receiver
//
//  Created by MacBook on 28/05/21.
//

import Foundation
import UIKit
import Core

protocol ReceiverRouter {
    func navigateToAmountInput(viewController: UIViewController, contacts: ContactsEntity)
    func navigateToHome()
}
