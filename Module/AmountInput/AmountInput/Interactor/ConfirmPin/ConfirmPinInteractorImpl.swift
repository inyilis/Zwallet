//
//  ConfirmPinInteractorImpl.swift
//  AmountInput
//
//  Created by MacBook on 30/05/21.
//

import Foundation
import Core

class ConfirmPinInteractorImpl: ConfirmPinInteractor {
    
    var interactorOutput: ConfirmPinInteractorOutput?
    let transferNetworkManager: TransferNetworkManager
    
    init(transferNetworkManager: TransferNetworkManager) {
        self.transferNetworkManager = transferNetworkManager
    }
    
    func transferTo(receiver: Int, amount: Int, notes: String) {
        self.transferNetworkManager.transfer(receiver: receiver, amount: amount, notes: notes) { (data, error) in
            if data != nil {
                self.interactorOutput?.transferResult(isSuccess: true)
            } else {
                self.interactorOutput?.transferResult(isSuccess: false)
            }
        }
    }
}
