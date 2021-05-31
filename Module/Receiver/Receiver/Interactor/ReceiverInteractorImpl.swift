//
//  ReceiverInteractorImpl.swift
//  Receiver
//
//  Created by MacBook on 28/05/21.
//

import Foundation
import Core

class ReceiverInteractorImpl: ReceiverInteractor {
    
    var interactorOutput: ReceiverInteractorOutput?
    
    let receiverNetworkManager: ReceiverNetworkManager
    
    init(receiverNetworkManager: ReceiverNetworkManager) {
        self.receiverNetworkManager = receiverNetworkManager
    }
    
    func getAllContacts() {
        self.receiverNetworkManager.getAllContacts { (data, error) in
            var contacts: [ContactsEntity] = []
            
            data?.forEach({ (invoiceData) in
                contacts.append(ContactsEntity(id: invoiceData.id, name: invoiceData.name, phone: invoiceData.phone, imageUrl: "\(AppConstant.baseUrl)\(invoiceData.image)"))
                self.interactorOutput?.loadedGetAllContacts(contacts: contacts)
            })
        }
    }
    
}
