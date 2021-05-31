//
//  ReceiverPresenterImpl.swift
//  Receiver
//
//  Created by MacBook on 28/05/21.
//

import Foundation
import UIKit
import Core

class ReceiverPresenterImpl: ReceiverPresenter {
    
    let view: ReceiverView
    let interactor: ReceiverInteractor
    let router: ReceiverRouter
    
    init(view: ReceiverView, interactor: ReceiverInteractor, router: ReceiverRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func navigateToAmountInput(viewController: UIViewController, contacts: ContactsEntity) {
        self.router.navigateToAmountInput(viewController: viewController, contacts: contacts)
    }
    
    func loadGetAllContacts() {
        self.interactor.getAllContacts()
    }
    
    func backToHome() {
        self.router.navigateToHome()
    }
    
}

extension ReceiverPresenterImpl: ReceiverInteractorOutput {
    
    func loadedGetAllContacts(contacts: [ContactsEntity]) {
        self.view.showGetAllContactData(contacts: contacts)
    }
    
}

