//
//  CreatePinInteractorImpl.swift
//  CreatePin
//
//  Created by MacBook on 27/05/21.
//

import Foundation
import Core

class CreatePinInteractorImpl: CreatePinInteractor {
    
    var interactorOutput: CreatePinInteractorOutput?
    let authNetworkManager: AuthNetworkManager
    
    init(networkManager: AuthNetworkManager) {
        self.authNetworkManager = networkManager
    }
    
    func setPin(pin: String) {
        self.authNetworkManager.setPin(pin: pin) { data, error in
            if data?.status == 200 {
                self.interactorOutput?.setPinResult(isSuccess: true)
            } else {
                self.interactorOutput?.setPinResult(isSuccess: false)
            }
        }
    }
    
}
