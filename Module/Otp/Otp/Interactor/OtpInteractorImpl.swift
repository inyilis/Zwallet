//
//  OtpInteractorImpl.swift
//  Otp
//
//  Created by MacBook on 26/05/21.
//

import Foundation
import Core

class OtpInteractorImpl: OtpInteractor {
    
    var interactorOutput: OtpInteractorOutput?
    let authNetworkManager: AuthNetworkManager
    
    init(networkManager: AuthNetworkManager) {
        self.authNetworkManager = networkManager
    }
    
    func postOtpCode(email: String, otp: String) {
        self.authNetworkManager.confirmOtp(email: email, otp: otp) { data, error in
            if data?.status == 200 {
                self.interactorOutput?.authenticationResult(isSuccess: true)
            } else {
                self.interactorOutput?.authenticationResult(isSuccess: false)
            }
        }
    }
    
}
