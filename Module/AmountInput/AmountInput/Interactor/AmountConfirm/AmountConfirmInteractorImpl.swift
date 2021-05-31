//
//  AmountConfirmInteractorImpl.swift
//  AmountInput
//
//  Created by MacBook on 30/05/21.
//

import Foundation
import Core

class AmountConfirmInteractorImpl: AmountConfirmInteractor {
    
    var interactorOutput: AmountConfirmInteractorOutput?
    
    let balanceNetworkManager: BalanceNetworkManager
    
    init(balanceNetworkManager: BalanceNetworkManager) {
        self.balanceNetworkManager = balanceNetworkManager
    }
    
    func getUserBalance() {
        self.balanceNetworkManager.getBalance { (data, error) in
            if let balance = data {
                self.interactorOutput?.loadedUserBalanceData(userBalance: balance.balance)
            }
        }
    }
    
}

